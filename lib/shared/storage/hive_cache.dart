import 'dart:convert';
import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';

const feedCacheBox = 'recipes_feed';
const userPrefsBox = 'user_prefs';

class HiveCacheService {
  HiveCacheService({this.maxBytes = 50 * 1024 * 1024});

  final int maxBytes;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox<Uint8List>(feedCacheBox),
      Hive.openBox(userPrefsBox),
    ]);
    _initialized = true;
  }

  Future<void> writeFeedSnapshot(String key, Map<String, dynamic> payload) async {
    await init();
    final box = Hive.box<Uint8List>(feedCacheBox);
    final bytes = Uint8List.fromList(utf8.encode(jsonEncode(payload)));
    await box.put(key, bytes);
    await _enforceBudget(box);
  }

  Map<String, dynamic>? readFeedSnapshot(String key) {
    if (!_initialized || !Hive.isBoxOpen(feedCacheBox)) return null;
    final box = Hive.box<Uint8List>(feedCacheBox);
    final bytes = box.get(key);
    if (bytes == null) return null;
    return jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>?;
  }

  Future<void> clearFeed() async {
    if (!_initialized) return;
    final box = Hive.box<Uint8List>(feedCacheBox);
    await box.clear();
  }

  Future<void> _enforceBudget(Box<Uint8List> box) async {
    var totalBytes = box.values.fold<int>(0, (sum, value) => sum + value.length);
    if (totalBytes <= maxBytes) return;

    final keys = box.keys.toList();
    for (final key in keys) {
      await box.delete(key);
      totalBytes = box.values.fold<int>(0, (sum, value) => sum + value.length);
      if (totalBytes <= maxBytes) {
        break;
      }
    }
  }
}

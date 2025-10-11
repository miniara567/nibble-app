import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:viral_recipes_app/features/feed/data/feed_repository.dart';
import 'package:viral_recipes_app/features/feed/ui/feed_screen.dart';
import 'package:viral_recipes_app/shared/network/models/recipe_dto.dart';
import 'package:viral_recipes_app/shared/network/viral_api_client.dart';
import 'package:viral_recipes_app/shared/storage/hive_cache.dart';

class _FakeApiClient extends Fake implements ViralApiClient {
  @override
  Future<RecipeCollectionDto> fetchRecipes({
    int limit = 20,
    String? cursor,
    String? tag,
    String? platform,
  }) async {
    return RecipeCollectionDto(
      items: List.generate(
        3,
        (index) => RecipeSummaryDto(
          id: '$index',
          title: 'Golden Recipe ${index + 1}',
          summary: 'Golden sample summary',
          heroImageUrl: 'https://example.com/golden.jpg',
          confidence: 0.85,
          platform: index.isEven ? 'tiktok' : 'instagram',
          tags: const ['golden', 'sample'],
        ),
      ),
      nextCursor: null,
    );
  }
}

class _NoopCacheService extends HiveCacheService {
  _NoopCacheService() : super(maxBytes: 0);

  @override
  Future<void> init() async {}

  @override
  Future<void> writeFeedSnapshot(String key, Map<String, dynamic> payload) async {}

  @override
  Map<String, dynamic>? readFeedSnapshot(String key) => null;
}

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('Feed screen renders across breakpoints', (tester) async {
    final repository = FeedRepository(
      apiClient: _FakeApiClient(),
      cacheService: _NoopCacheService(),
      featureFlagService: null,
      analyticsService: null,
    );

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: const [
        Device.phone,
        Device.tabletLandscape,
        Device.desktop,
      ])
      ..addScenario(
        widget: ProviderScope(
          overrides: [feedRepositoryProvider.overrideWithValue(repository)],
          child: const MaterialApp(home: FeedScreen()),
        ),
        name: 'feed_breakpoints',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'feed_breakpoints');
  });
}

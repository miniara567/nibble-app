import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAnalyticsProvider = Provider<FirebaseAnalytics?>((ref) => null);

final remoteConfigProvider = Provider<FirebaseRemoteConfig?>((ref) => null);

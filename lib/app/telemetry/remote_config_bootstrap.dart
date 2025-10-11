import 'package:firebase_remote_config/firebase_remote_config.dart';

const _remoteConfigDefaults = <String, Object>{
  'viral_recipes_feed_enabled': false,
  'remote_config_update_interval_min': 30,
};

/// Initializes Firebase Remote Config with project defaults.
Future<void> initializeRemoteConfig(
  FirebaseRemoteConfig remoteConfig,
) async {
  await remoteConfig.setDefaults(_remoteConfigDefaults);
  try {
    await remoteConfig.fetchAndActivate();
  } on Exception {
    // In the event of failure we fall back to defaults. Errors are intentionally
    // swallowed here; callers should rely on analytics/observability to monitor.
  }
}

import 'package:firebase_remote_config/firebase_remote_config.dart';

class FeatureFlagService {
  FeatureFlagService(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  bool get isFeedEnabled =>
      _remoteConfig.getBool('viral_recipes_feed_enabled');

  Duration get remoteConfigUpdateInterval => Duration(
        minutes:
            _remoteConfig.getInt('remote_config_update_interval_min').clamp(5, 120),
      );
}

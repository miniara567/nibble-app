# Viral Recipe Aggregation Feature Docs

## Setup Checklist
- Install Flutter 3.24 (stable) and Dart 3.5 (`flutter --version`).
- Configure Firebase for iOS, Android, and Web by placing generated config files in platform folders (see placeholders).
- Set environment variables or config entries for `INGESTION_API_BASE_URL`, `REMOTE_CONFIG_UPDATE_INTERVAL_MIN`, and `VIDEO_CDN_BASE_URL`.
- Run `flutter pub get` followed by `flutter pub run build_runner build --delete-conflicting-outputs` to generate models.
- For local Remote Config testing, seed defaults using `remoteConfig.setDefaults` before enabling network fetches.

## Infrastructure Overview
- **ViralApiClient** (`lib/shared/network/viral_api_client.dart`): wraps Dio with retry-safe defaults and exposes recipe list/detail, transcript, and submission endpoints.
- **Data Transfer Objects** (`lib/shared/network/models/*`): Freezed models mirroring OpenAPI responses. Regenerate via `flutter pub run build_runner build` after changes.
- **HiveCacheService** (`lib/shared/storage/hive_cache.dart`): manages offline feed snapshots with a 50 MB eviction policy.
- **FeatureFlagService** (`lib/shared/analytics/feature_flag_service.dart`): reads Remote Config toggles, notably `viral_recipes_feed_enabled`.
- **AnalyticsService** (`lib/app/telemetry/analytics_service.dart`): emits telemetry events defined in the spec (feed_view, recipe_open, etc.).
- **Design System** (`lib/shared/design_system/`): centralizes breakpoints, spacing, and theming via `buildLightTheme()`.

Additional implementation details will be appended as features evolve.

## Feed Module Notes (US1)
- Entry point: `FeedScreen` (`lib/features/feed/ui/feed_screen.dart`) renders responsive sliver list with filter chips and load-more affordance.
- State management: `FeedController` + `FeedState` (`lib/features/feed/state/`) orchestrate API calls, caching, and filter application via Riverpod.
- Repository: `FeedRepository` (`lib/features/feed/data/feed_repository.dart`) attempts real API calls, falls back to cached data, and seeds curated sample data when offline.
- Telemetry: `AnalyticsService.logFeedView` invoked after each successful fetch; feature flag gating respects Remote Config `viral_recipes_feed_enabled` when available.
- Tests: `test/unit/feed/feed_repository_test.dart`, `test/widgets/feed/feed_list_test.dart`, `test/goldens/feed/feed_breakpoints_golden_test.dart`, and `integration_test/feed_flow_test.dart` document expected behaviour and visual baselines.

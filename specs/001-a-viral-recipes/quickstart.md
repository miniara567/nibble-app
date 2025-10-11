# Quickstart: Viral Recipe Aggregation MVP

## Prerequisites
- Flutter 3.24 (stable channel) with Dart 3.5 (`flutter --version` to verify).
- Xcode 15+/CocoaPods, Android Studio w/ SDK 34, Chrome for web.
- Firebase project configured with:
  - Remote Config parameter `viral_recipes_feed_enabled` (default `false`).
  - Analytics enabled for event logging.
- `.env` or `lib/shared/config/app_config.dart` supplying:
  - `INGESTION_API_BASE_URL`
  - `REMOTE_CONFIG_UPDATE_INTERVAL_MIN`
  - `VIDEO_CDN_BASE_URL`
- Install Melos or preferred package manager if monorepo integration is required (optional).

## Setup Steps
1. `flutter pub get`
2. Configure Firebase:
   - Place `google-services.json` (Android) in `android/app/`.
   - Place `GoogleService-Info.plist` (iOS) in `ios/Runner/`.
   - For web, run `flutterfire configure` and update `web/index.html`.
3. Create Hive boxes:
   ```dart
   await Hive.openBox('recipes_feed');
   await Hive.openBox('user_prefs');
   ```
4. Initialize Remote Config overrides for local dev:
   ```dart
   await remoteConfig.setDefaults({'viral_recipes_feed_enabled': true});
   ```
5. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate freezed/json files.

## Running the App
- Mobile: `flutter run -d ios` or `flutter run -d android`
- Web: `flutter run -d chrome --web-renderer canvaskit`
- Verify feature flag toggling by switching Remote Config value and calling `remoteConfig.fetchAndActivate()`.

## Testing Obligations
- Static analysis & formatting (CI gate):
  ```bash
  flutter analyze
  dart format --set-exit-if-changed .
  ```
- Unit & widget tests:
  ```bash
  flutter test --coverage
  ```
- Golden tests (per breakpoint):
  ```bash
  flutter test --update-goldens test/goldens/*
  ```
  Store golden baselines in `goldens/feed` and `goldens/detail`.
- Integration tests (feed + submission flows):
  ```bash
  flutter test integration_test/feed_flow_test.dart
  flutter test integration_test/submission_flow_test.dart
  ```
- Accessibility smoke test checklist:
  - VoiceOver/TalkBack screen reader traversal for feed/detail/submission.
  - Keyboard-only navigation on web build (tab/shift-tab, enter/space).
  - Contrast validation using Axe/Accessibility Insights report.

## Manual QA Checklist
- Validate layouts at 320 px, 768 px, 1280 px (embed in QA runbook).
- Confirm video playback fallback (poster + transcript) when autoplay blocked.
- Submit supported & unsupported video URLs; observe status messaging and retries.
- Toggle feature flag off → ensure feed hidden and fallback message displayed.
- Verify telemetry events (feed_view, recipe_open, submission_complete) arrive in Firebase DebugView.

## Documentation Deliverables
- Update `docs/viral_recipe_aggregation/README.md` with architecture overview, API endpoints, and QA checklist outcomes.
- Append release notes (flag rollout, known limitations) to `docs/releases.md`.
- Generate DartDoc for public classes in `lib/features/*/ui` and `lib/shared/network/`.

## Rollout & Monitoring
- Release toggled via Remote Config staged rollout (10% → 50% → 100%).
- Monitor:
  - Crash-free sessions per platform.
  - Video start latency (analytics event timings).
  - Submission success rate; escalate if <90% within first hour of rollout.
- Rollback plan: disable `viral_recipes_feed_enabled`, clear Hive cache, invalidate CDN content references.

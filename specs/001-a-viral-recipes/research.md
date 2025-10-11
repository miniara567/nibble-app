# Research Summary: Viral Recipe Aggregation MVP

## Overview
Phase 0 research resolved tooling and integration unknowns needed to deliver the viral recipe feed, detail, and submission flows. Each decision below captures rationale and alternatives considered.

### Decision: Adopt Riverpod + StateNotifier for feature state
- **Rationale**: Riverpod offers testable, provider-scoped state that works across Flutter mobile and web. StateNotifier keeps business logic deterministic, supports code-splitting per feature, and integrates cleanly with generated models (`freezed`).
- **Alternatives considered**:
  - **Bloc**: Mature but heavier ceremony and less alignment with existing Riverpod default in constitution; added boilerplate not justified for MVP.
  - **Provider**: Minimal but lacks robust test tooling and modular overrides needed for larger feature set.

### Decision: Use `video_player` + `chewie` for cross-platform playback
- **Rationale**: `video_player` is first-party and supports iOS/Android/Web. `chewie` layers accessible controls, caption toggles, and consistent UI across platforms, meeting WCAG requirements.
- **Alternatives considered**:
  - **Better Player**: Feature-rich but web support lags and bundle size higher.
  - **Platform web views**: Increase maintenance and break golden testing due to external rendering.

### Decision: Consume REST API exposed by ingestion service
- **Rationale**: REST endpoints (`/recipes`, `/recipes/{id}`, `/submissions`) map directly to user flows and simplify caching. Existing ingestion pipeline emits JSON payloads; REST avoids GraphQL gateway overhead for MVP.
- **Alternatives considered**:
  - **GraphQL**: Flexible querying but requires additional schema stitching and tooling; unnecessary for initial limited data shapes.
  - **gRPC**: Efficient but poorly supported in Flutter web and complicates API gateway rollout.

### Decision: Store offline snapshots with Hive
- **Rationale**: Hive offers lightweight, schema-less local storage with good Flutter web/mobile support and async APIs. We can cap storage via box size checks to respect 50 MB constraint.
- **Alternatives considered**:
  - **Shared Preferences**: Key/value only—insufficient for nested recipe data.
  - **Isar**: Powerful but heavier setup and larger binary size; Hive sufficient for MVP volume.

### Decision: Golden & accessibility tooling via `golden_toolkit` + `flutter_test`
- **Rationale**: `golden_toolkit` simplifies multi-device golden captures, integrates with `DeviceBuilder` for 320/768/1280 widths, and plays well with CI. Accessibility semantics verified via `flutter_test` semantics testers, ensuring WCAG coverage.
- **Alternatives considered**:
  - **Screenshot testing with manual scripts**: Harder to automate, inconsistent across environments.
  - **No golden tests**: Violates constitution requirement for visual regression coverage.

### Decision: Feature flag managed through Firebase Remote Config
- **Rationale**: Remote Config already part of tech stack for analytics; flag flips without redeploy, enabling staged rollout and rollback aligned with constitution.
- **Alternatives considered**:
  - **Hard-coded app settings**: Requires redeploy; no remote control.
  - **Third-party feature flag service**: Adds cost/integration overhead for MVP.

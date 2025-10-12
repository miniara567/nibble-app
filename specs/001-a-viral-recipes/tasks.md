---
description: "Task list for Viral Recipe Aggregation MVP implementation"
---

# Tasks: Viral Recipe Aggregation MVP

**Input**: Design documents from `/specs/001-a-viral-recipes/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: Per the constitution, include unit, widget/integration, and golden tests committed in the plan/spec. Tests appear before implementation tasks for each story (TDD-ready).

**Organization**: Tasks are grouped by user story to enable independent implementation and testing, and include documentation, accessibility, and rollout work products.

## Format: `[ID] [P?] [Story] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions
- Single Flutter project rooted under `lib/`, `test/`, `integration_test/`, `goldens/`, and `docs/`
- Feature modules: `lib/features/{feed|detail|submission}/{data|state|ui}`
- Shared utilities: `lib/shared/`

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Establish project scaffolding, dependencies, and base app shell.

- T001 [x] Configure `pubspec.yaml` with required dependencies (Riverpod, go_router, dio, freezed, video_player, chewie, hive, firebase_analytics, firebase_remote_config, golden_toolkit, integration_test, mocktail).
- T002 [x] Register Firebase configs (`android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`, `web/index.html`) and initialize Firebase in `lib/app/app.dart`.
- T003 [x] Create base app entry (`lib/app/app.dart`) with MaterialApp, theming, and Remote Config bootstrap in `lib/app/telemetry/remote_config_bootstrap.dart`.
- T004 [P] [x] Scaffold router (`lib/app/router.dart`) with shell routes for feed, detail, and submission screens.
- T005 [x] Create shared directory structure with placeholders: `lib/shared/{design_system,network,storage,widgets,analytics}/README.md`.
- T006 [x] Document setup steps and prerequisites in `docs/viral_recipe_aggregation/README.md` initial section.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure required before any user story work can begin.

- T007 [x] Implement REST client (`lib/shared/network/viral_api_client.dart`) using dio with interceptors, base URL config, and error mapping.
- T008 [x] Define data transfer models shared across stories using freezed (`lib/shared/network/models/recipe_dto.dart`, `lib/shared/network/models/submission_dto.dart`) and run `build_runner`.
- T009 [x] Implement Hive cache service (`lib/shared/storage/hive_cache.dart`) with eviction policy enforcing 50 MB cap.
- T010 [x] Create feature flag service (`lib/shared/analytics/feature_flag_service.dart`) wrapping Firebase Remote Config and exposing `viral_recipes_feed_enabled`.
- T011 [x] Build analytics service (`lib/app/telemetry/analytics_service.dart`) that logs events defined in data-model TelemetryEvent table.
- T012 [x] Establish global design tokens and responsive breakpoints in `lib/shared/design_system/tokens.dart` and `lib/shared/design_system/app_theme.dart`.
- T013 [x] Add shared accessibility utilities (`lib/shared/widgets/a11y_helpers.dart`) covering focus management and semantics.
- T014 [x] Update `docs/viral_recipe_aggregation/README.md` with infrastructure overview (API client, caching, feature flag, analytics).

**Checkpoint**: Foundation ready — user story implementation can now begin in parallel.

---

## Phase 3: User Story 1 - Browse Viral Recipe Feed (Priority: P1) 🎯 MVP

**Goal**: Present a responsive feed of viral recipe videos with extracted summaries and filters.

**Independent Test**: Validate feed flow via `integration_test/feed_flow_test.dart` using staged API fixtures, ensuring responsiveness at mobile/tablet/desktop breakpoints and accessibility compliance.

### Tests for User Story 1 (write before implementation) ⚠️

- T015 [P] [x] [US1] Create unit tests for feed repository/data mapping in `test/unit/feed/feed_repository_test.dart`.
- T016 [P] [x] [US1] Build widget tests for feed list interactions (keyboard navigation, focus, video controls) in `test/widgets/feed/feed_list_test.dart`.
- T017 [P] [x] [US1] Produce golden tests for 320 px, 768 px, 1280 px layouts in `test/goldens/feed/feed_breakpoints_golden_test.dart` with assets under `goldens/feed/`.
- T018 [P] [x] [US1] Author integration test covering feed load, filter, and video playback telemetry in `integration_test/feed_flow_test.dart`.

### Implementation for User Story 1

- T019 [x] [US1] Implement feed repository (`lib/features/feed/data/feed_repository.dart`) consuming `/recipes` endpoint with caching + filters.
- T020 [x] [US1] Create feed controller with Riverpod StateNotifier (`lib/features/feed/state/feed_controller.dart`) handling pagination, filters, and error states.
- T021 [P] [x] [US1] Build responsive feed screen (`lib/features/feed/ui/feed_screen.dart`) using breakpoints and slivers for smooth scrolling.
- T022 [P] [x] [US1] Implement viral recipe card widget (`lib/features/feed/ui/widgets/viral_recipe_card.dart`) with video preview, transcript toggle, and confidence badges.
- T023 [P] [x] [US1] Add filter bar + platform chip selector (`lib/features/feed/ui/widgets/feed_filter_bar.dart`) wired to controller.
- T024 [x] [US1] Hook analytics + feature flag gating within `feed_controller.dart` and `feed_screen.dart`.
- T025 [x] [US1] Document feed module behavior, telemetry, and QA checklist updates in `docs/viral_recipe_aggregation/README.md` (feed section).

**Checkpoint**: User Story 1 should now be fully functional, tested, and independently demoable.

---

## Phase 4: User Story 2 - Inspect Recipe Details (Priority: P2)

**Goal**: Provide an accessible recipe detail view with full instructions, nutrition, transcript access, and sharing.

**Independent Test**: Run `integration_test/recipe_detail_flow_test.dart` to open detail from a seeded recipe, verify transcript retrieval, sharing interactions, and accessibility requirements across breakpoints.

### Tests for User Story 2 (write before implementation) ⚠️

- T026 [P] [US2] Write unit tests for detail repository (recipe + transcript fetch + error handling) in `test/unit/detail/recipe_detail_repository_test.dart`.
- T027 [P] [US2] Create widget tests for detail screen focus order, zoom behavior, and action tray in `test/widgets/detail/recipe_detail_screen_test.dart`.
- T028 [P] [US2] Add golden tests for detail view breakpoints in `test/goldens/detail/recipe_detail_golden_test.dart` with assets under `goldens/detail/`.
- T029 [P] [US2] Implement integration test for detail flow, including transcript fallback, in `integration_test/recipe_detail_flow_test.dart`.

### Implementation for User Story 2

- T030 [x] [US2] Implement detail repository (`lib/features/detail/data/recipe_detail_repository.dart`) consuming `/recipes/{id}` and `/recipes/{id}/transcript`.
- T031 [x] [US2] Create detail controller (`lib/features/detail/state/recipe_detail_controller.dart`) managing state, transcript toggles, and telemetry.
- T032 [P] [US2] Build recipe detail screen (`lib/features/detail/ui/recipe_detail_screen.dart`) supporting responsive layout and transcript/caption sections.
- T033 [P] [US2] Implement ingredient + instruction widgets (`lib/features/detail/ui/widgets/ingredient_list.dart`, `lib/features/detail/ui/widgets/instruction_steps.dart`).
- T034 [P] [US2] Add share/copy action bar (`lib/features/detail/ui/widgets/detail_action_bar.dart`) with clipboard + share sheet integrations.
- T035 [x] [US2] Update analytics service to record detail events (open, share, video_play) and ensure Remote Config fallback messaging.
- T036 [x] [US2] Expand documentation in `docs/viral_recipe_aggregation/README.md` with detail view flows, accessibility notes, and telemetry mapping.

**Checkpoint**: User Story 2 should now deliver a fully detailed recipe experience and remain independently testable.

---

## Phase 5: User Story 3 - Submit Viral Recipe Source (Priority: P3)

**Goal**: Enable users to submit viral video URLs, observe processing status, and view results or failures with clear messaging.

**Independent Test**: Execute `integration_test/submission_flow_test.dart` covering URL validation, status polling, success, and failure paths with accessibility validation on mobile and web.

### Tests for User Story 3 (write before implementation) ⚠️

- T037 [P] [US3] Create unit tests for submission validators and repository interactions in `test/unit/submission/submission_repository_test.dart`.
- T038 [P] [US3] Add widget tests for submission form accessibility and error states in `test/widgets/submission/submission_form_test.dart`.
- T039 [P] [US3] Produce golden tests for submission + status views in `test/goldens/submission/submission_states_golden_test.dart` with assets under `goldens/submission/`.
- T040 [P] [US3] Develop integration test verifying submission lifecycle and polling in `integration_test/submission_flow_test.dart`.

### Implementation for User Story 3

- T041 [ ] [US3] Implement submission repository (`lib/features/submission/data/submission_repository.dart`) for `/submissions` POST + `/submissions/{id}` GET polling.
- T042 [ ] [US3] Build validators + supported platform rules (`lib/features/submission/data/submission_validator.dart`).
- T043 [ ] [US3] Create submission controller (`lib/features/submission/state/submission_controller.dart`) handling status updates, polling cadence, and telemetry.
- T044 [P] [US3] Implement submission screen (`lib/features/submission/ui/submission_screen.dart`) with responsive layout and informative messaging.
- T045 [P] [US3] Build submission status list widget (`lib/features/submission/ui/widgets/submission_status_list.dart`) showing pending/complete/failed states.
- T046 [ ] [US3] Wire analytics + Remote Config (toggle fallback) for submission flows in `submission_controller.dart`.
- T047 [ ] [US3] Update `docs/viral_recipe_aggregation/README.md` with submission workflow instructions, validation rules, and QA expectations.

**Checkpoint**: User Story 3 completed—submission pipeline, UI, and tests are independently verifiable.

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Finalize quality, documentation, rollout, and monitoring.

- T048 [ ] Perform manual accessibility and cross-device QA; record results in `docs/viral_recipe_aggregation/README.md` appendix.
- T049 [ ] Update `docs/releases.md` with rollout plan, feature flag strategy, known limitations, and remediation steps.
- T050 [ ] Configure CI workflow (e.g., `.github/workflows/flutter.yml` or `tool/ci.sh`) to run `flutter analyze`, `dart format`, `flutter test --coverage`, integration tests, and golden diff checks.
- T051 [ ] Conduct performance validation (scroll FPS, video start latency) and document metrics versus targets in `docs/viral_recipe_aggregation/README.md`.
- T052 [ ] Finalize Remote Config rollout script and rollback checklist in `docs/viral_recipe_aggregation/README.md` and ensure cache clear routine in `lib/shared/storage/hive_cache.dart`.

---

## Dependencies & Execution Order

- **Phase Dependencies**:
  - Setup (Phase 1) → Foundational (Phase 2) → User Stories (Phases 3–5) → Polish.
  - Foundational tasks must complete before any user story begins.
  - User Story 1 (P1) delivers MVP; User Story 2 and 3 can proceed after foundational work, but recommend sequential completion (US1 → US2 → US3) to build on shared artifacts.

- **Story Dependencies**:
  - US1 (feed) depends on foundational API client, models, caching, and feature flags.
  - US2 (detail) depends on US1 shared models but can start once foundational tasks complete (no hard dependency on US1 implementation).
  - US3 (submission) depends only on foundational services.

---

## Parallel Execution Examples

- **User Story 1**:
  - Parallel tests: T015, T016, T017, T018.
  - Parallel implementation: T021 (UI), T022 (card), T023 (filter bar) can proceed after T019/T020.

- **User Story 2**:
  - Parallel tests: T026, T027, T028, T029.
  - Parallel implementation: T032, T033, T034 can run alongside once T030/T031 ready.

- **User Story 3**:
  - Parallel tests: T037, T038, T039, T040.
  - Parallel implementation: T044 and T045 can run after T041–T043 baseline logic lands.

---

## Implementation Strategy

1. Complete Setup and Foundational phases to satisfy constitution gates (feature flag, analytics, caching, design system).
2. Deliver MVP via User Story 1 (feed) with full testing and documentation—this unlocks early demos.
3. Layer in User Story 2 (detail) for deeper engagement, ensuring accessibility and sharing workflows.
4. Add User Story 3 (submission) to grow content coverage and feedback loops.
5. Finish with Polish tasks: accessibility audits, CI hardening, performance validation, rollout documentation, and Remote Config readiness.

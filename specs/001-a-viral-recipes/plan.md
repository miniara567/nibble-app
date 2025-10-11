# Implementation Plan: Viral Recipe Aggregation MVP

**Branch**: `001-a-viral-recipes` | **Date**: 2025-10-11 | **Spec**: [`spec.md`](./spec.md)  
**Input**: Feature specification from `/specs/001-a-viral-recipes/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

Deliver an MVP Flutter experience that surfaces viral recipe videos aggregated from social platforms, renders extracted ingredients and steps in a responsive feed and detail view, and lets users submit new video URLs. The app consumes a REST API exposed by the ingestion service, stores lightweight preferences locally, and instrument telemetry/feature flags to manage staged rollout across mobile, tablet, and web breakpoints.

## Technical Context

**Language/Version**: Dart 3.5 with Flutter 3.24 (stable channel)  
**Primary Dependencies**: Riverpod + StateNotifier, go_router, dio, freezed/json_serializable, video_player + chewie, cached_network_image, golden_toolkit, integration_test, firebase_analytics, firebase_remote_config  
**Storage**: Remote REST API for recipe data (Ingestion Service), local caching via Hive boxes for feed snapshots & preferences  
**Testing**: flutter_test, riverpod_test, integration_test harness, golden_toolkit, accessibility_test (semantics), mocktail  
**Target Platform**: iOS 16+, Android 12+, Flutter Web (Chrome/Edge latest)  
**Project Type**: Single Flutter project targeting mobile + web deployments  
**Performance Goals**: Home feed time-to-interactive ≤ 2.5s on Wi-Fi, steady 60fps scrolling, video start latency ≤ 1.5s, golden diff tolerance ≤ 0.5%  
**Constraints**: Offline cache max 50 MB, video playback must respect autoplay policies, API latency budget ≤ 500 ms p95, accessibility WCAG 2.1 AA compliance  
**Scale/Scope**: MVP covering 3 primary screens (feed, detail, submissions) with 100–250 active recipes and up to 50 concurrent user submissions/hour

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **P1 · Cross-Platform Flutter UX**: Document responsive breakpoints, accessibility plan (WCAG 2.1 AA checks), and golden test coverage for visual states.
- **Response**: Deliver responsive layouts at 320 px, 768 px, and 1280 px widths using `LayoutBuilder` breakpoints, verify semantics with TalkBack/VoiceOver/NVDA, and capture golden screenshots per breakpoint via golden_toolkit. Accessibility checklist (focus order, labels, captions) included in QA tasks.
- **P2 · Comprehensible Feature Modules**: Specify feature directory layout, chosen state management (default Riverpod), and anticipated complexity hotspots with mitigation.
- **Response**: Features reside under `lib/features/{feed|detail|submission}/{data|state|ui}`, shared resources in `lib/shared/`. Riverpod + StateNotifier handles state; heavy video cards use sliver-based virtualization; complexity flagged in plan for video buffering + offline caching.
- **P3 · Documentation Is a Deliverable**: List the docs to create/update (e.g., `docs/<feature>/README.md`) and call out any API surfaces needing DartDoc.
- **Response**: Author `docs/viral_recipe_aggregation/README.md`, update `docs/releases.md` with rollout notes, and ensure new public widgets/services carry `///` DartDoc. Architecture decisions logged in spec + docs.
- **P4 · Test the Experience**: Outline required unit, widget/integration, and golden tests plus the coverage target for the feature.
- **Response**: Unit tests cover mappers, validators, submission workflows; widget tests for feed card, detail scaffold; integration_test for end-to-end submission flow; golden tests for feed/detail breakpoints. Maintain ≥80% lib coverage and enforce CI (`flutter analyze`, `dart format`, `flutter test --coverage`).
- **P5 · Sustainable Delivery**: Describe feature flags, rollout/rollback steps, telemetry, and performance budgets to validate before release.
- **Response**: Gate UI via `RemoteConfig` flag `viral_recipes_feed_enabled`, log analytics for video engagement & submission funnel, monitor performance metrics (scroll jank, video start) in release dashboards, and document rollback steps (disable flag, clear cached entries).

## Project Structure

### Documentation (this feature)

```
specs/001-a-viral-recipes/
├── plan.md          # Implementation plan (this file)
├── research.md      # Phase 0 findings & decisions
├── data-model.md    # Domain entities & validation
├── quickstart.md    # Setup, testing, rollout guidance
├── contracts/
│   └── openapi.yaml # REST endpoints for ingestion service
└── tasks.md         # Generated later via /speckit.tasks
```

### Source Code (repository root)

```
lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   ├── theme/
│   └── telemetry/
├── shared/
│   ├── design_system/
│   ├── network/
│   ├── widgets/
│   ├── storage/
│   └── analytics/
└── features/
    ├── feed/
    │   ├── data/
    │   ├── state/
    │   └── ui/
    ├── detail/
    │   ├── data/
    │   ├── state/
    │   └── ui/
    └── submission/
        ├── data/
        ├── state/
        └── ui/

test/
├── unit/
│   ├── feed/
│   ├── detail/
│   └── submission/
├── widgets/
└── utils/

integration_test/
├── feed_flow_test.dart
└── submission_flow_test.dart

goldens/
├── feed/
└── detail/

assets/
├── translations/
├── images/
└── mock_data/
```

**Structure Decision**: Single Flutter project with feature-first modules under `lib/features`, shared concerns centralized under `lib/shared`, and dedicated directories for integration and golden tests to support constitution-mandated validation.

## Complexity Tracking

*Fill ONLY if Constitution Check has violations that must be justified*

No constitution violations identified for this feature; remediation table not required.

## Phase 0: Research Outline

1. Validate Riverpod + StateNotifier as the state management baseline for feed/detail/submission flows.
2. Confirm video playback stack (video_player + chewie) functions consistently across iOS, Android, and Web, including caption support.
3. Define REST contract surface with ingestion service covering feed listing, recipe detail, transcript, and submission endpoints.
4. Select local caching mechanism (Hive) and devise eviction strategy to respect 50 MB constraint.
5. Establish accessibility and golden testing toolkit configuration for responsive UI validation.

See `research.md` for findings, rationale, and rejected alternatives.

## Phase 1: Design Snapshot

- **Data model**: Recipes, video sources, ingredients, instruction steps, submission requests, and telemetry events documented in `data-model.md` with relationships and validation rules.
- **API contracts**: RESTful OpenAPI spec in `contracts/openapi.yaml` defining `/recipes`, `/recipes/{id}`, `/recipes/{id}/transcript`, `/submissions`, `/submissions/{id}` endpoints plus schemas for client consumption.
- **Quickstart**: `quickstart.md` details environment setup (Flutter, Firebase), feature flag wiring, running analyzers/tests/coverage, and cross-device QA checklist.
- **Agent context**: Codex agent guidance updated post-plan to track Flutter + Riverpod stack and project structure.

## Post-Design Constitution Check

- Responsive breakpoints, accessibility testing, and golden coverage remain integral—Phase 1 outputs include golden baselines per breakpoint and accessibility QA steps.
- Module structure, docs commitments, and Riverpod choices align with `lib/features/*` blueprint and docs deliverables enumerated in quickstart + plan.
- Testing commitments (unit, widget, integration, golden) mapped to dedicated directories with coverage target referenced in quickstart instructions.
- Feature flag (`viral_recipes_feed_enabled`), telemetry events, and rollback path documented; rollout steps linked to quickstart and contracts.

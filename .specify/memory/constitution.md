<!--
Sync Impact Report
Version change: N/A → 1.0.0
Modified principles:
- I. Cross-Platform Flutter UX
- II. Comprehensible Feature Modules
- III. Documentation Is a Deliverable
- IV. Test the Experience, Not Just the Code
- V. Sustainable Delivery & Operations
Added sections:
- Delivery Standards
- Development Workflow
Removed sections:
- None
Templates requiring updates:
- ✅ .specify/templates/plan-template.md
- ✅ .specify/templates/spec-template.md
- ✅ .specify/templates/tasks-template.md
Follow-up TODOs:
- None
-->

# Viral Recipes App Constitution

## Core Principles

### I. Cross-Platform Flutter UX
- MUST design every user journey as a single Flutter experience that renders responsively at mobile (≥320px), tablet (≥768px), and desktop web (≥1024px) breakpoints before release.
- MUST meet WCAG 2.1 AA accessibility guidelines, including focus order, hit targets (≥44×44dp), semantic labels, and screen reader support validated during QA.
- MUST capture visual acceptance criteria (design tokens, mockups, or Figma links) in the feature spec and attach golden reference screenshots for UI states prior to merge.
**Rationale**: Consistent, accessible experiences across web and mobile protect product quality and reduce rework.

### II. Comprehensible Feature Modules
- MUST implement each feature under `lib/features/<feature_name>/` with `ui/`, `state/`, and `data/` subdirectories; shared utilities belong in `lib/shared/`.
- MUST declare the chosen state-management approach in plan.md; if unspecified, default to Riverpod. Divergence requires explicit approval captured in the plan.
- MUST keep public entry points limited to feature shells (e.g., `<FeatureName>Screen` and routing helpers) and document any additional exports in the feature README.
- MUST refactor or document exceptions in plan.md when a file exceeds 200 lines or nests conditionals/loops beyond a cyclomatic complexity of 10.
**Rationale**: Lightweight, predictable structure keeps codebases easy to navigate and maintain as the team scales.

### III. Documentation Is a Deliverable
- MUST add or update `docs/<feature_name>/README.md` (or the relevant parent doc) with overview, setup, and decision notes for every merged feature.
- MUST accompany all exported classes, mixins, and functions with DartDoc (`///`) summaries explaining behavior and usage constraints.
- MUST record architectural or third-party dependency decisions in the feature plan and link back to source references or ADRs within docs/.
**Rationale**: Persistent documentation preserves team knowledge and keeps the codebase self-explanatory.

### IV. Test the Experience, Not Just the Code
- MUST pair every logic change with unit tests and every high-priority user story with widget/integration tests that exercise the full flow.
- MUST create golden tests for UI states where visual regressions would impact UX, updating references only with intentional design approval.
- MUST maintain line coverage ≥80% for `lib/` and track it in CI; any dip requires a remediation task in tasks.md before release.
- MUST run `flutter analyze`, `dart format --set-exit-if-changed .`, and `flutter test --coverage` in CI prior to merge.
**Rationale**: Holistic testing enforces confidence in behavior, visuals, and stability across devices.

### V. Sustainable Delivery & Operations
- MUST feature-gate user-facing changes via toggle/service configuration to enable phased rollouts and rapid rollback.
- MUST document performance budgets (e.g., frame build/render time ≤16ms on target devices) and verify them during QA.
- MUST track release notes per sprint in `docs/releases.md`, using semantic versioning for app builds and documenting migrations.
- MUST keep CI/CD pipelines reproducible: infrastructure as code, deterministic dependencies (`flutter pub get --locked`), and rotating credentials documented in ops checklists.
**Rationale**: Operational discipline protects reliability, makes rollouts predictable, and avoids brittle workflows.

## Delivery Standards

- Flutter SDK: track the stable channel; adopt updates within two weeks while recording migration notes in `docs/releases.md`.
- Design system: centralize typography, color, spacing, and elevation tokens under `lib/shared/design_system/`; changes require golden test updates and spec approval.
- Packages: prefer first-party Flutter packages; any additional dependency requires justification in plan.md covering maintenance, license, and impact on bundle size.
- Localization: all user-visible strings live in ARB files managed via `intl`; new features include at least English copy and mark pending locales explicitly.
- Telemetry: instrument key screens with analytics and crash reporting hooks defined in `lib/shared/telemetry/`, capturing user IDs with privacy safeguards.

## Development Workflow

1. Capture feature intent through `/speckit.plan` with Constitution Check responses covering breakpoints, state management, documentation, testing, and rollout plans.
2. Produce `/speckit.spec` outlining prioritized user stories, accessibility acceptance criteria, and documentation deliverables.
3. Generate `/speckit.tasks` ensuring every user story includes implementation, testing, documentation, and rollout verification tasks.
4. Implement incrementally: keep branches small, land tests and docs alongside code, and attach golden updates with design sign-off.
5. Perform pre-merge validation: CI green, manual cross-device smoke test, docs published, feature flag verification recorded in tasks.md.

## Governance

- The constitution supersedes prior workflow guidance. Amendments require proposal in docs/ADR, impacted principle redlines, and approval from product + engineering leads.
- Versioning follows semantic rules: MAJOR for principle removals/replacements; MINOR for new principles/sections or expanded scope; PATCH for clarifications.
- Compliance reviews occur at the start of each sprint and before major releases; unresolved violations must be logged with remediation tasks and due dates.
- Store ratified constitutions in git history; every amendment commit references the approving leads and rationale in the commit message.

**Version**: 1.0.0 | **Ratified**: 2025-10-11 | **Last Amended**: 2025-10-11

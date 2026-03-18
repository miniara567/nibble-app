# Viral Recipes App Architecture Overview

```mermaid
flowchart TD
    subgraph App Shell
        A[lib/app/app.dart] --> B[Riverpod ProviderScope]
        A --> C[Router (lib/app/router.dart)]
        A --> D[Theme (lib/shared/design_system)]
    end

    subgraph Shared Services
        E[AnalyticsService]:::service
        F[FeatureFlagService]:::service
        G[ViralApiClient + DTOs]:::service
        H[HiveCacheService]:::service
    end

    subgraph Feed Feature
        F1[FeedRepository]:::data --> F2[FeedController]:::state --> F3[FeedScreen]:::ui
        F3 -->|Uses| F4[ViralRecipeCard / FilterBar]:::widget
    end

    subgraph Detail Feature
        D1[RecipeDetailRepository]:::data --> D2[RecipeDetailController]:::state --> D3[RecipeDetailScreen]:::ui
        D3 -->|Uses| D4[IngredientList / InstructionSteps / DetailActionBar]:::widget
    end

    subgraph Submission Feature
        S1[SubmissionRepository]:::data --> S2[SubmissionController]:::state --> S3[SubmissionScreen]:::ui
        S3 -->|Uses| S4[SubmissionStatusList]:::widget
    end

    B --> E
    B --> F
    F --> F1
    F --> D1
    F --> S1
    E --> F1
    E --> D1
    E --> S1
    G --> F1
    G --> D1
    G --> S1
    H --> F1
    H --> D1
    C --> F3
    C --> D3
    C --> S3

    classDef data fill:#C6F6D5,stroke:#22543D,color:#1B4332
    classDef state fill:#BEE3F8,stroke:#2B6CB0,color:#1A365D
    classDef ui fill:#FBD38D,stroke:#C05621,color:#7B341E
    classDef widget fill:#F6E05E,stroke:#B7791F,color:#744210
    classDef service fill:#E9D8FD,stroke:#553C9A,color:#3C366B
```

**Legend**
- Data layer: Repositories talking to APIs and cache.
- State layer: Riverpod controllers/notifiers driving UI.
- UI layer: Screens and specialized widgets.
- Shared services supply analytics, feature flags, network, and caching reused by all features.

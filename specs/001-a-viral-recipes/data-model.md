# Data Model: Viral Recipe Aggregation MVP

## Recipe
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| id | String (UUID) | Yes | Stable identifier from ingestion service |
| title | String | Yes | 5–120 characters; display title |
| summary | String | Yes | Short teaser ≤ 250 chars |
| heroImageUrl | URI | Yes | HTTPS only; fallback image required |
| videoSourceId | String | Yes | FK → VideoSource.id |
| tags | List<String> | No | Normalized lowercase labels (cuisine, difficulty) |
| nutrition | NutritionInfo | No | Present when extraction confidence ≥ 0.6 |
| confidence | double | Yes | Range 0–1; drives UI badges |
| createdAt | DateTime | Yes | ISO 8601 from ingestion service |

Relationships: Recipe 1—* Ingredient, Recipe 1—* InstructionStep.

## VideoSource
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| id | String | Yes | Matches Recipe.videoSourceId |
| platform | Enum {tiktok, instagram, youtube, other} | Yes | Drives attribution icons |
| creatorHandle | String | Yes | Prefixed with `@`; 2–50 chars |
| sourceUrl | URI | Yes | HTTPS; used for share payload |
| publishedAt | DateTime | Yes | ISO 8601 |
| durationSeconds | int | Yes | 1–900 seconds |
| viewCount | int | No | Non-negative |
| status | Enum {active, removed, private} | Yes | Determines fallback messaging |

## Ingredient
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| id | String | Yes | Locally generated (Recipe scoped) |
| recipeId | String | Yes | FK → Recipe.id |
| name | String | Yes | 1–80 chars, lowercase display override |
| quantity | double | No | ≥ 0 |
| unit | String | No | Standardized (e.g., "cup", "tbsp") |
| preparation | String | No | Optional notes (e.g., "chopped") |
| confidence | double | Yes | 0–1; highlight low confidence in UI |

## InstructionStep
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| id | String | Yes | Locally generated |
| recipeId | String | Yes | FK → Recipe.id |
| order | int | Yes | Sequential starting at 1 |
| description | String | Yes | 10–280 chars |
| timestampSeconds | int | No | Aligns with video; ≥ 0 |
| mediaSnapshotUrl | URI | No | HTTPS; used for still frame preview |
| confidence | double | Yes | 0–1; used to flag uncertain steps |

## NutritionInfo
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| calories | int | No | ≥ 0 |
| proteinGrams | double | No | ≥ 0 |
| carbsGrams | double | No | ≥ 0 |
| fatGrams | double | No | ≥ 0 |
| servings | int | No | ≥ 1 |
| notes | String | No | Clarifies estimation method |

Embedded within Recipe when available; hide if null.

## SubmissionRequest
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| id | String | Yes | UUID generated server-side |
| submittedUrl | URI | Yes | HTTPS; must match supported platforms |
| requesterId | String | No | Anonymous by default |
| status | Enum {pending, processing, published, failed} | Yes | Drives status chips |
| createdAt | DateTime | Yes | ISO 8601 |
| updatedAt | DateTime | Yes | ISO 8601 |
| estimatedCompletionMinutes | int | No | 1–60 |
| failureReason | String | No | Present when status = failed |

## TelemetryEvent (Client emission only)
| Field | Type | Required | Validation / Notes |
| --- | --- | --- | --- |
| eventName | Enum {feed_view, recipe_open, video_play, recipe_share, submission_start, submission_complete} | Yes | Canonical analytics names |
| recipeId | String | No | Included where relevant |
| submissionId | String | No | For submission events |
| timestamp | DateTime | Yes | Client ISO 8601 |
| metadata | Map<String, dynamic> | No | e.g., deviceType, breakpoint |

## Validation Rules & Derived Data
- Reject recipes missing ≥70% of ingredient fields; flag for manual review.
- Highlight low-confidence sections (<0.6) with tooltip warnings in UI.
- Cache feed response keyed by breakpoint + filter options; expire after 24 hours or when Remote Config version changes.
- Submission polling occurs every 15 seconds until status leaves `processing`, then stops.

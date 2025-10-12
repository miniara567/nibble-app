import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:viral_recipes_app/app/providers.dart';
import 'package:viral_recipes_app/app/telemetry/analytics_service.dart';
import 'package:viral_recipes_app/features/detail/data/recipe_detail_models.dart';
import 'package:viral_recipes_app/shared/analytics/feature_flag_service.dart';
import 'package:viral_recipes_app/shared/network/models/recipe_dto.dart';
import 'package:viral_recipes_app/shared/network/viral_api_client.dart';
import 'package:viral_recipes_app/shared/storage/hive_cache.dart';

class RecipeDetailRepository {
  RecipeDetailRepository({
    required ViralApiClient apiClient,
    required HiveCacheService cacheService,
    required FeatureFlagService? featureFlagService,
    required AnalyticsService? analyticsService,
  })  : _apiClient = apiClient,
        _cacheService = cacheService,
        _featureFlagService = featureFlagService,
        _analyticsService = analyticsService;

  final ViralApiClient _apiClient;
  final HiveCacheService _cacheService;
  final FeatureFlagService? _featureFlagService;
  final AnalyticsService? _analyticsService;

  static const _cachePrefix = 'recipe';

  Future<RecipeDetail> fetchRecipe(String id) async {
    final flagEnabled = _featureFlagService?.isFeedEnabled ?? true;
    if (!flagEnabled) {
      throw Exception('Recipe access disabled');
    }

    await _cacheService.init();
    final cacheKey = '$_cachePrefix:$id';
    final cached = _cacheService.readFeedSnapshot(cacheKey);
    if (cached != null) {
      return _sampleDetailFromJson(cached);
    }

    try {
      final dto = await _apiClient.fetchRecipeDetail(id);
      RecipeTranscriptDto? transcript;
      try {
        transcript = await _apiClient.fetchTranscript(id);
      } catch (_) {
        transcript = null;
      }
      final detail = _mapDetail(dto, transcript);
      unawaited(_cacheService.writeFeedSnapshot(cacheKey, detail.toJson()));
      _analyticsService?.logRecipeOpen(recipeId: id);
      return detail;
    } catch (error, stackTrace) {
      debugPrint('Recipe detail load failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      final fallback = _sampleRecipes[id] ?? _sampleRecipes.values.first;
      return fallback;
    }
  }

  RecipeDetail _mapDetail(RecipeDto dto, RecipeTranscriptDto? transcript) {
    return RecipeDetail(
      id: dto.id,
      title: dto.title,
      summary: dto.summary,
      platform: dto.videoSource.platform,
      heroImageUrl: dto.heroImageUrl,
      creatorHandle: dto.videoSource.creatorHandle,
      ingredients: dto.ingredients
          .map(
            (ingredient) => IngredientDetail(
              name: ingredient.name,
              quantity: ingredient.quantity,
              unit: ingredient.unit,
              preparation: ingredient.preparation,
              confidence: ingredient.confidence,
            ),
          )
          .toList(),
      steps: dto.instructions
          .map(
            (step) => InstructionDetail(
              order: step.order,
              description: step.description,
              timestampSeconds: step.timestampSeconds,
              mediaSnapshotUrl: step.mediaSnapshotUrl,
              confidence: step.confidence,
            ),
          )
          .toList(),
      nutrition: dto.nutrition == null
          ? null
          : NutritionDetail(
              calories: dto.nutrition?.calories,
              proteinGrams: dto.nutrition?.proteinGrams,
              carbsGrams: dto.nutrition?.carbsGrams,
              fatGrams: dto.nutrition?.fatGrams,
              servings: dto.nutrition?.servings,
              notes: dto.nutrition?.notes,
            ),
      transcript: transcript == null
          ? const []
          : transcript.transcript
              .map(
                (segment) => TranscriptSegment(
                  startSeconds: segment.startSeconds,
                  endSeconds: segment.endSeconds,
                  text: segment.text,
                ),
              )
              .toList(),
      sourceUrl: dto.videoSource.sourceUrl,
      confidence: dto.confidence,
      durationSeconds: dto.videoSource.durationSeconds,
      viewCount: dto.videoSource.viewCount,
    );
  }
}

extension on RecipeDetail {
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'summary': summary,
        'platform': platform,
        'heroImageUrl': heroImageUrl,
        'creatorHandle': creatorHandle,
        'ingredients': ingredients
            .map(
              (ingredient) => {
                'name': ingredient.name,
                'quantity': ingredient.quantity,
                'unit': ingredient.unit,
                'preparation': ingredient.preparation,
                'confidence': ingredient.confidence,
              },
            )
            .toList(),
        'steps': steps
            .map(
              (step) => {
                'order': step.order,
                'description': step.description,
                'timestampSeconds': step.timestampSeconds,
                'mediaSnapshotUrl': step.mediaSnapshotUrl,
                'confidence': step.confidence,
              },
            )
            .toList(),
        'nutrition': nutrition == null
            ? null
            : {
                'calories': nutrition?.calories,
                'proteinGrams': nutrition?.proteinGrams,
                'carbsGrams': nutrition?.carbsGrams,
                'fatGrams': nutrition?.fatGrams,
                'servings': nutrition?.servings,
                'notes': nutrition?.notes,
              },
        'transcript': transcript
            .map(
              (segment) => {
                'startSeconds': segment.startSeconds,
                'endSeconds': segment.endSeconds,
                'text': segment.text,
              },
            )
            .toList(),
        'sourceUrl': sourceUrl,
        'confidence': confidence,
        'durationSeconds': durationSeconds,
        'viewCount': viewCount,
      };
}

RecipeDetail _sampleDetailFromJson(Map<String, dynamic> json) {
  final ingredients = (json['ingredients'] as List<dynamic>)
      .map(
        (item) => IngredientDetail(
          name: item['name'] as String,
          quantity: (item['quantity'] as num?)?.toDouble(),
          unit: item['unit'] as String?,
          preparation: item['preparation'] as String?,
          confidence: (item['confidence'] as num).toDouble(),
        ),
      )
      .toList();
  final steps = (json['steps'] as List<dynamic>)
      .map(
        (item) => InstructionDetail(
          order: item['order'] as int,
          description: item['description'] as String,
          timestampSeconds: item['timestampSeconds'] as int?,
          mediaSnapshotUrl: item['mediaSnapshotUrl'] as String?,
          confidence: (item['confidence'] as num).toDouble(),
        ),
      )
      .toList();
  final transcript = (json['transcript'] as List<dynamic>)
      .map(
        (item) => TranscriptSegment(
          startSeconds: (item['startSeconds'] as num).toDouble(),
          endSeconds: (item['endSeconds'] as num).toDouble(),
          text: item['text'] as String,
        ),
      )
      .toList();
  return RecipeDetail(
    id: json['id'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    platform: json['platform'] as String,
    heroImageUrl: json['heroImageUrl'] as String,
    creatorHandle: json['creatorHandle'] as String,
    ingredients: ingredients,
    steps: steps,
    nutrition: json['nutrition'] == null
        ? null
        : NutritionDetail(
            calories: json['nutrition']['calories'] as int?,
            proteinGrams: (json['nutrition']['proteinGrams'] as num?)?.toDouble(),
            carbsGrams: (json['nutrition']['carbsGrams'] as num?)?.toDouble(),
            fatGrams: (json['nutrition']['fatGrams'] as num?)?.toDouble(),
            servings: json['nutrition']['servings'] as int?,
            notes: json['nutrition']['notes'] as String?,
          ),
    transcript: transcript,
    sourceUrl: json['sourceUrl'] as String,
    confidence: (json['confidence'] as num).toDouble(),
    durationSeconds: json['durationSeconds'] as int?,
    viewCount: json['viewCount'] as int?,
  );
}

final recipeDetailRepositoryProvider = Provider<RecipeDetailRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = const String.fromEnvironment(
    'INGESTION_API_BASE_URL',
    defaultValue: 'https://api.example.com',
  );
  final client = ViralApiClient(dio: dio, baseUrl: baseUrl);

  FeatureFlagService? featureFlagService;
  final remoteConfig = ref.watch(remoteConfigProvider);
  if (remoteConfig != null) {
    featureFlagService = FeatureFlagService(remoteConfig);
  }

  AnalyticsService? analyticsService;
  final analytics = ref.watch(firebaseAnalyticsProvider);
  if (analytics != null) {
    analyticsService = AnalyticsService(analytics);
  }

  return RecipeDetailRepository(
    apiClient: client,
    cacheService: HiveCacheService(),
    featureFlagService: featureFlagService,
    analyticsService: analyticsService,
  );
});

final Map<String, RecipeDetail> _sampleRecipes = {
  'sample-0': RecipeDetail(
    id: 'sample-0',
    title: 'Whipped Feta Pasta Bake',
    summary:
        'Creamy baked feta tossed with blistered tomatoes and al dente pasta for a viral weeknight win.',
    platform: 'tiktok',
    heroImageUrl:
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=1080&q=80',
    creatorHandle: '@foodiequeen',
    ingredients: const [
      IngredientDetail(name: 'Cherry tomatoes', quantity: 2, unit: 'cups', confidence: 0.9),
      IngredientDetail(name: 'Block feta cheese', quantity: 1, unit: '8oz', confidence: 0.92),
      IngredientDetail(name: 'Olive oil', quantity: 0.25, unit: 'cup', confidence: 0.88),
      IngredientDetail(name: 'Garlic cloves', quantity: 4, unit: null, preparation: 'minced', confidence: 0.85),
      IngredientDetail(name: 'Pasta', quantity: 12, unit: 'oz', confidence: 0.9),
      IngredientDetail(name: 'Fresh basil', quantity: 0.5, unit: 'cup', preparation: 'torn', confidence: 0.82),
    ],
    steps: const [
      InstructionDetail(order: 1, description: 'Preheat oven to 400°F (200°C). Add tomatoes and feta to baking dish, drizzle with olive oil.', confidence: 0.9),
      InstructionDetail(order: 2, description: 'Bake 25 minutes until tomatoes burst and feta softens. Meanwhile cook pasta until al dente.', confidence: 0.88),
      InstructionDetail(order: 3, description: 'Remove dish, mash feta and tomatoes together with garlic. Toss in pasta and fresh basil.', confidence: 0.9),
    ],
    nutrition: const NutritionDetail(
      calories: 520,
      proteinGrams: 18,
      carbsGrams: 60,
      fatGrams: 24,
      servings: 4,
      notes: 'Estimated using feta full-fat block and whole wheat pasta.',
    ),
    transcript: const [
      TranscriptSegment(startSeconds: 0, endSeconds: 6, text: 'Add your tomatoes and feta to the pan.'),
      TranscriptSegment(startSeconds: 6, endSeconds: 12, text: 'Bake until bubbly, then smash it all together.'),
      TranscriptSegment(startSeconds: 12, endSeconds: 18, text: 'Toss in pasta and basil—dinner is done!'),
    ],
    sourceUrl: 'https://www.tiktok.com/@foodiequeen/video/123456789',
    confidence: 0.9,
    durationSeconds: 210,
    viewCount: 2300000,
  ),
  'sample-1': RecipeDetail(
    id: 'sample-1',
    title: 'Crispy Salmon Rice Bowls',
    summary: 'Pan-crisped salmon flaked over seasoned rice with spicy mayo and pickled cucumbers.',
    platform: 'instagram',
    heroImageUrl:
        'https://images.unsplash.com/photo-1466637574441-749b8f19452f?auto=format&fit=crop&w=1080&q=80',
    creatorHandle: '@yummy_tok',
    ingredients: const [
      IngredientDetail(name: 'Cooked rice', quantity: 3, unit: 'cups', confidence: 0.85),
      IngredientDetail(name: 'Salmon fillet', quantity: 1, unit: 'lb', preparation: 'skin on', confidence: 0.9),
      IngredientDetail(name: 'Soy sauce', quantity: 2, unit: 'tbsp', confidence: 0.82),
      IngredientDetail(name: 'Sesame oil', quantity: 1, unit: 'tbsp', confidence: 0.8),
      IngredientDetail(name: 'Spicy mayo', quantity: 0.25, unit: 'cup', confidence: 0.78),
      IngredientDetail(name: 'Pickled cucumbers', quantity: 1, unit: 'cup', confidence: 0.75),
    ],
    steps: const [
      InstructionDetail(order: 1, description: 'Season salmon with soy sauce and sesame oil, then sear skin-side down until crispy.', confidence: 0.86),
      InstructionDetail(order: 2, description: 'Press rice into pan until edges crisp. Flake salmon over top.', confidence: 0.84),
      InstructionDetail(order: 3, description: 'Finish with spicy mayo drizzle, pickled cucumbers, and sesame seeds.', confidence: 0.86),
    ],
    nutrition: const NutritionDetail(
      calories: 610,
      proteinGrams: 32,
      carbsGrams: 48,
      fatGrams: 28,
      servings: 3,
      notes: 'Macros include spicy mayo drizzle.',
    ),
    transcript: const [
      TranscriptSegment(startSeconds: 0, endSeconds: 5, text: 'Let the salmon get super crispy, trust me.'),
      TranscriptSegment(startSeconds: 5, endSeconds: 10, text: 'Press your rice until it sizzles and browns.'),
    ],
    sourceUrl: 'https://www.instagram.com/reel/abcdefg123',
    confidence: 0.88,
    durationSeconds: 180,
    viewCount: 1450000,
  ),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeCollectionDtoImpl _$$RecipeCollectionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeCollectionDtoImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => RecipeSummaryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RecipeSummaryDto>[],
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$$RecipeCollectionDtoImplToJson(
        _$RecipeCollectionDtoImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': instance.nextCursor,
    };

_$RecipeSummaryDtoImpl _$$RecipeSummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeSummaryDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      heroImageUrl: json['heroImageUrl'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      platform: json['platform'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      summary: json['summary'] as String?,
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecipeSummaryDtoImplToJson(
        _$RecipeSummaryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'heroImageUrl': instance.heroImageUrl,
      'confidence': instance.confidence,
      'platform': instance.platform,
      'tags': instance.tags,
      'summary': instance.summary,
      'durationSeconds': instance.durationSeconds,
      'viewCount': instance.viewCount,
    };

_$RecipeDtoImpl _$$RecipeDtoImplFromJson(Map<String, dynamic> json) =>
    _$RecipeDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      heroImageUrl: json['heroImageUrl'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      videoSource:
          VideoSourceDto.fromJson(json['videoSource'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => InstructionStepDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutrition: json['nutrition'] == null
          ? null
          : NutritionInfoDto.fromJson(
              json['nutrition'] as Map<String, dynamic>),
      transcriptAvailable: json['transcriptAvailable'] as bool?,
    );

Map<String, dynamic> _$$RecipeDtoImplToJson(_$RecipeDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'heroImageUrl': instance.heroImageUrl,
      'confidence': instance.confidence,
      'tags': instance.tags,
      'videoSource': instance.videoSource,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'nutrition': instance.nutrition,
      'transcriptAvailable': instance.transcriptAvailable,
    };

_$IngredientDtoImpl _$$IngredientDtoImplFromJson(Map<String, dynamic> json) =>
    _$IngredientDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      preparation: json['preparation'] as String?,
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$IngredientDtoImplToJson(_$IngredientDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'preparation': instance.preparation,
      'confidence': instance.confidence,
    };

_$InstructionStepDtoImpl _$$InstructionStepDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionStepDtoImpl(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      description: json['description'] as String,
      timestampSeconds: (json['timestampSeconds'] as num?)?.toInt(),
      mediaSnapshotUrl: json['mediaSnapshotUrl'] as String?,
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$InstructionStepDtoImplToJson(
        _$InstructionStepDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'description': instance.description,
      'timestampSeconds': instance.timestampSeconds,
      'mediaSnapshotUrl': instance.mediaSnapshotUrl,
      'confidence': instance.confidence,
    };

_$NutritionInfoDtoImpl _$$NutritionInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NutritionInfoDtoImpl(
      calories: (json['calories'] as num?)?.toInt(),
      proteinGrams: (json['proteinGrams'] as num?)?.toDouble(),
      carbsGrams: (json['carbsGrams'] as num?)?.toDouble(),
      fatGrams: (json['fatGrams'] as num?)?.toDouble(),
      servings: (json['servings'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$NutritionInfoDtoImplToJson(
        _$NutritionInfoDtoImpl instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'proteinGrams': instance.proteinGrams,
      'carbsGrams': instance.carbsGrams,
      'fatGrams': instance.fatGrams,
      'servings': instance.servings,
      'notes': instance.notes,
    };

_$VideoSourceDtoImpl _$$VideoSourceDtoImplFromJson(Map<String, dynamic> json) =>
    _$VideoSourceDtoImpl(
      id: json['id'] as String,
      platform: json['platform'] as String,
      creatorHandle: json['creatorHandle'] as String,
      sourceUrl: json['sourceUrl'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      status: json['status'] as String,
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VideoSourceDtoImplToJson(
        _$VideoSourceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'creatorHandle': instance.creatorHandle,
      'sourceUrl': instance.sourceUrl,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'status': instance.status,
      'durationSeconds': instance.durationSeconds,
      'viewCount': instance.viewCount,
    };

_$TranscriptEntryDtoImpl _$$TranscriptEntryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscriptEntryDtoImpl(
      startSeconds: (json['startSeconds'] as num).toDouble(),
      endSeconds: (json['endSeconds'] as num).toDouble(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$TranscriptEntryDtoImplToJson(
        _$TranscriptEntryDtoImpl instance) =>
    <String, dynamic>{
      'startSeconds': instance.startSeconds,
      'endSeconds': instance.endSeconds,
      'text': instance.text,
    };

_$RecipeTranscriptDtoImpl _$$RecipeTranscriptDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeTranscriptDtoImpl(
      transcript: (json['transcript'] as List<dynamic>?)
              ?.map(
                  (e) => TranscriptEntryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TranscriptEntryDto>[],
      language: json['language'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RecipeTranscriptDtoImplToJson(
        _$RecipeTranscriptDtoImpl instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
      'language': instance.language,
      'confidence': instance.confidence,
    };

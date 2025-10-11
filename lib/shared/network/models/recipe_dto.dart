import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_dto.freezed.dart';
part 'recipe_dto.g.dart';

@freezed
class RecipeCollectionDto with _$RecipeCollectionDto {
  const factory RecipeCollectionDto({
    @Default(<RecipeSummaryDto>[]) List<RecipeSummaryDto> items,
    String? nextCursor,
  }) = _RecipeCollectionDto;

  factory RecipeCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeCollectionDtoFromJson(json);
}

@freezed
class RecipeSummaryDto with _$RecipeSummaryDto {
  const factory RecipeSummaryDto({
    required String id,
    required String title,
    required String heroImageUrl,
    required double confidence,
    required String platform,
    @Default(<String>[]) List<String> tags,
    String? summary,
    int? durationSeconds,
    int? viewCount,
  }) = _RecipeSummaryDto;

  factory RecipeSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeSummaryDtoFromJson(json);
}

@freezed
class RecipeDto with _$RecipeDto {
  const factory RecipeDto({
    required String id,
    required String title,
    required String summary,
    required String heroImageUrl,
    required double confidence,
    required List<String> tags,
    required VideoSourceDto videoSource,
    required List<IngredientDto> ingredients,
    required List<InstructionStepDto> instructions,
    NutritionInfoDto? nutrition,
    bool? transcriptAvailable,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
}

@freezed
class IngredientDto with _$IngredientDto {
  const factory IngredientDto({
    required String id,
    required String name,
    double? quantity,
    String? unit,
    String? preparation,
    required double confidence,
  }) = _IngredientDto;

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);
}

@freezed
class InstructionStepDto with _$InstructionStepDto {
  const factory InstructionStepDto({
    required String id,
    required int order,
    required String description,
    int? timestampSeconds,
    String? mediaSnapshotUrl,
    required double confidence,
  }) = _InstructionStepDto;

  factory InstructionStepDto.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepDtoFromJson(json);
}

@freezed
class NutritionInfoDto with _$NutritionInfoDto {
  const factory NutritionInfoDto({
    int? calories,
    double? proteinGrams,
    double? carbsGrams,
    double? fatGrams,
    int? servings,
    String? notes,
  }) = _NutritionInfoDto;

  factory NutritionInfoDto.fromJson(Map<String, dynamic> json) =>
      _$NutritionInfoDtoFromJson(json);
}

@freezed
class VideoSourceDto with _$VideoSourceDto {
  const factory VideoSourceDto({
    required String id,
    required String platform,
    required String creatorHandle,
    required String sourceUrl,
    required DateTime publishedAt,
    required String status,
    int? durationSeconds,
    int? viewCount,
  }) = _VideoSourceDto;

  factory VideoSourceDto.fromJson(Map<String, dynamic> json) =>
      _$VideoSourceDtoFromJson(json);
}

@freezed
class TranscriptEntryDto with _$TranscriptEntryDto {
  const factory TranscriptEntryDto({
    required double startSeconds,
    required double endSeconds,
    required String text,
  }) = _TranscriptEntryDto;

  factory TranscriptEntryDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptEntryDtoFromJson(json);
}

@freezed
class RecipeTranscriptDto with _$RecipeTranscriptDto {
  const factory RecipeTranscriptDto({
    @Default(<TranscriptEntryDto>[]) List<TranscriptEntryDto> transcript,
    String? language,
    double? confidence,
  }) = _RecipeTranscriptDto;

  factory RecipeTranscriptDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeTranscriptDtoFromJson(json);
}

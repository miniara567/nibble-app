import 'package:equatable/equatable.dart';

class RecipeDetail extends Equatable {
  const RecipeDetail({
    required this.id,
    required this.title,
    required this.summary,
    required this.platform,
    required this.heroImageUrl,
    required this.creatorHandle,
    required this.ingredients,
    required this.steps,
    required this.nutrition,
    required this.transcript,
    required this.sourceUrl,
    required this.confidence,
    this.durationSeconds,
    this.viewCount,
  });

  final String id;
  final String title;
  final String summary;
  final String platform;
  final String heroImageUrl;
  final String creatorHandle;
  final List<IngredientDetail> ingredients;
  final List<InstructionDetail> steps;
  final NutritionDetail? nutrition;
  final List<TranscriptSegment> transcript;
  final String sourceUrl;
  final double confidence;
  final int? durationSeconds;
  final int? viewCount;

  @override
  List<Object?> get props => [
        id,
        title,
        summary,
        platform,
        heroImageUrl,
        creatorHandle,
        ingredients,
        steps,
        nutrition,
        transcript,
        sourceUrl,
        confidence,
        durationSeconds,
        viewCount,
      ];
}

class IngredientDetail extends Equatable {
  const IngredientDetail({
    required this.name,
    this.quantity,
    this.unit,
    this.preparation,
    required this.confidence,
  });

  final String name;
  final double? quantity;
  final String? unit;
  final String? preparation;
  final double confidence;

  @override
  List<Object?> get props => [name, quantity, unit, preparation, confidence];
}

class InstructionDetail extends Equatable {
  const InstructionDetail({
    required this.order,
    required this.description,
    this.timestampSeconds,
    this.mediaSnapshotUrl,
    required this.confidence,
  });

  final int order;
  final String description;
  final int? timestampSeconds;
  final String? mediaSnapshotUrl;
  final double confidence;

  @override
  List<Object?> get props =>
      [order, description, timestampSeconds, mediaSnapshotUrl, confidence];
}

class NutritionDetail extends Equatable {
  const NutritionDetail({
    this.calories,
    this.proteinGrams,
    this.carbsGrams,
    this.fatGrams,
    this.servings,
    this.notes,
  });

  final int? calories;
  final double? proteinGrams;
  final double? carbsGrams;
  final double? fatGrams;
  final int? servings;
  final String? notes;

  @override
  List<Object?> get props =>
      [calories, proteinGrams, carbsGrams, fatGrams, servings, notes];
}

class TranscriptSegment extends Equatable {
  const TranscriptSegment({
    required this.startSeconds,
    required this.endSeconds,
    required this.text,
  });

  final double startSeconds;
  final double endSeconds;
  final String text;

  @override
  List<Object?> get props => [startSeconds, endSeconds, text];
}

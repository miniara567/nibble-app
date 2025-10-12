import 'package:equatable/equatable.dart';
import 'package:viral_recipes_app/features/detail/data/recipe_detail_models.dart';

enum RecipeDetailStatus { initial, loading, loaded, error }

class RecipeDetailState extends Equatable {
  const RecipeDetailState({
    this.status = RecipeDetailStatus.initial,
    this.detail,
    this.errorMessage,
  });

  final RecipeDetailStatus status;
  final RecipeDetail? detail;
  final String? errorMessage;

  RecipeDetailState copyWith({
    RecipeDetailStatus? status,
    RecipeDetail? detail,
    String? errorMessage,
  }) {
    return RecipeDetailState(
      status: status ?? this.status,
      detail: detail ?? this.detail,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, detail, errorMessage];
}

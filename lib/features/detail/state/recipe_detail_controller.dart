import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_recipes_app/features/detail/data/recipe_detail_repository.dart';
import 'package:viral_recipes_app/features/detail/state/recipe_detail_state.dart';

final recipeDetailControllerProvider = StateNotifierProvider.autoDispose
    .family<RecipeDetailController, RecipeDetailState, String>((ref, id) {
  final repository = ref.watch(recipeDetailRepositoryProvider);
  final controller = RecipeDetailController(repository: repository, recipeId: id);
  controller.load();
  return controller;
});

class RecipeDetailController extends StateNotifier<RecipeDetailState> {
  RecipeDetailController({
    required RecipeDetailRepository repository,
    required String recipeId,
  })  : _repository = repository,
        _recipeId = recipeId,
        super(const RecipeDetailState());

  final RecipeDetailRepository _repository;
  final String _recipeId;

  Future<void> load() async {
    state = state.copyWith(status: RecipeDetailStatus.loading, errorMessage: null);
    try {
      final detail = await _repository.fetchRecipe(_recipeId);
      state = state.copyWith(
        status: RecipeDetailStatus.loaded,
        detail: detail,
        errorMessage: null,
      );
    } catch (error) {
      state = state.copyWith(
        status: RecipeDetailStatus.error,
        errorMessage: error.toString(),
      );
    }
  }
}

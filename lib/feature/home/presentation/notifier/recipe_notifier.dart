import 'package:chefrecipe/feature/home/domain/usecases/recipe_usecases.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_state.dart';
import 'package:chefrecipe/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeNotifier extends StateNotifier<RecipeState> {
  RecipeNotifier({required this.recipeUseCases})
      : super(const RecipeState(recipeModel: null)) {
    getRecipe("Chicken");
  }
  final RecipeUseCases recipeUseCases;

  getRecipe(String query) async {
    state = state.copyWith(isLoading: true);

    final result = await recipeUseCases.getRecipeFromUrl(query);
    result.fold((failure) {
      state = state.copyWith(failure: failure, isLoading: false);
    }, (success) {
      state = state.copyWith(recipeModel: success, isLoading: false);
    });
  }
}

final recipeProvider = StateNotifierProvider<RecipeNotifier, RecipeState>(
    (ref) => sl<RecipeNotifier>());

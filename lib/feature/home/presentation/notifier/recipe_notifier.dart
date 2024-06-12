import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/domain/usecases/recipe_usecases.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_state.dart';
import 'package:chefrecipe/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeNotifier extends StateNotifier<RecipeState> {
  RecipeNotifier({required this.recipeUseCases})
      : super(RecipeState(recipeModel: RecipeModel()));
  final RecipeUseCases recipeUseCases;

  getRecipe() async {
    state = state.copyWith(isLoading: true);

    final result = await recipeUseCases.getRecipeFromUrl();
    result.fold((failure) {
      state = state.copyWith(failure: failure, isLoading: false);
    }, (success) {
      state = state.copyWith(recipeModel: success, isLoading: false);
    });
  }
}

final recipeProvider = StateNotifierProvider<RecipeNotifier, RecipeState>(
    (ref) => sl<RecipeNotifier>());

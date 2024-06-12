import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe_state.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState({
    @Default(true) bool isLoading,
    RecipeModel? recipeModel,
    Failure? failure,
  }) = _RecipeState;

  const RecipeState._();
}

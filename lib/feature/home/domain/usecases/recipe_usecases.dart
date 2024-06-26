import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeUseCases {
  final RecipeRepository recipeRepository;

  const RecipeUseCases({required this.recipeRepository});

  Future<Either<Failure, RecipeModel?>> getRecipeFromUrl(String query) async {
    final result = await recipeRepository.getRecipeFromUrl(query);
    return result;
  }
}

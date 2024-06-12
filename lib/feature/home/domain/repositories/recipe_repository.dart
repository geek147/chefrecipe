import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeRepository {
  Future<Either<Failure, RecipeModel>> getRecipeFromUrl();
}

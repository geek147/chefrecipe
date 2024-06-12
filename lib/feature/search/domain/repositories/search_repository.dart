import 'package:chefrecipe/core/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, void>> searchRecipeByImage(String imagePath);
  Future<Either<Failure, void>> searchRecipeByIngredients(
      List<String> ingredients);
}

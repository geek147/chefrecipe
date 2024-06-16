import 'package:flutter/services.dart';
import 'package:chefrecipe/core/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, String?>> searchRecipeByImage(List<Uint8List> image);
  Future<Either<Failure, String?>> searchRecipeByIngredients(
      List<String> ingredients);
}

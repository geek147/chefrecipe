import 'package:flutter/services.dart';
import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchUseCases {
  final SearchRepository searchRepository;

  const SearchUseCases({required this.searchRepository});

  Future<Either<Failure, String?>> searchRecipeByImage(
      List<Uint8List> image) async {
    await Future.delayed(const Duration(seconds: 1));
    return searchRepository.searchRecipeByImage(image);
  }

  Future<Either<Failure, String?>> searchRecipeByIngredients(
      List<String> ingredients) async {
    await Future.delayed(const Duration(seconds: 1));
    return searchRepository.searchRecipeByIngredients(ingredients);
  }
}

import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchUseCases {
  final SearchRepository searchRepository;

  const SearchUseCases({required this.searchRepository});

  Future<Either<Failure, void>> searchRecipeByImage(String imagePath) async {
    await Future.delayed(const Duration(seconds: 1));
    return searchRepository.searchRecipeByImage(imagePath);
  }

  Future<Either<Failure, void>> searchRecipeByIngredients(
      List<String> ingredients) async {
    await Future.delayed(const Duration(seconds: 1));
    return searchRepository.searchRecipeByIngredients(ingredients);
  }
}

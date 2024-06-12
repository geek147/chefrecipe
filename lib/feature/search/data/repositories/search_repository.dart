import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/search/data/datasourcea/search_datasources.dart';
import 'package:chefrecipe/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource searchDatasource;

  const SearchRepositoryImpl({required this.searchDatasource});

  @override
  Future<Either<Failure, void>> searchRecipeByImage(String imagePath) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> searchRecipeByIngredients(
      List<String> ingredients) {
    throw UnimplementedError();
  }
}

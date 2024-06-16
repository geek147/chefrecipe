import 'package:chefrecipe/core/exceptions/exceptions.dart';
import 'package:flutter/services.dart';
import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/search/data/datasourcea/search_datasources.dart';
import 'package:chefrecipe/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource searchDatasource;

  const SearchRepositoryImpl({required this.searchDatasource});

  @override
  Future<Either<Failure, String?>> searchRecipeByImage(
      List<Uint8List> image) async {
    try {
      final result = await searchDatasource.searchRecipeByImage(image);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on InternetException catch (_) {
      return left(SocketFailure());
    } on AuthenticationException catch (_) {
      return left(AuthenticationFailure());
    } catch (e) {
      return left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> searchRecipeByIngredients(
      List<String> ingredients) async {
    try {
      final result =
          await searchDatasource.searchRecipeByIngredients(ingredients);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on InternetException catch (_) {
      return left(SocketFailure());
    } on AuthenticationException catch (_) {
      return left(AuthenticationFailure());
    } catch (e) {
      return left(UnexpectedFailure());
    }
  }
}

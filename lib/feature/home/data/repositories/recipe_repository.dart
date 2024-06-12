import 'package:chefrecipe/core/exceptions/exceptions.dart';
import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/datasourcea/recipe_datasources.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDatasource recipeDatasource;

  const RecipeRepositoryImpl({required this.recipeDatasource});

  @override
  Future<Either<Failure, RecipeModel>> getRecipeFromUrl() async {
    try {
      final result = await recipeDatasource.getRecipeFromApi();
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
  Future<Either<Failure, RecipeModel>> searchRecipeByImage(String imagePath) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecipeModel>> searchRecipeByIngredients(
      List<String> ingredients) {
    throw UnimplementedError();
  }
}

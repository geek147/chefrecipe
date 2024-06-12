import 'package:chefrecipe/constants/rest_api_urls.dart';
import 'package:chefrecipe/feature/home/data/datasourcea/recipe_datasources.dart';
import 'package:chefrecipe/feature/home/data/repositories/recipe_repository.dart';
import 'package:chefrecipe/feature/home/domain/repositories/recipe_repository.dart';
import 'package:chefrecipe/feature/home/domain/usecases/recipe_usecases.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I; // Service location

Future<void> init() async {
  // Factory - each time a new instance of the Class

  // Presentation layer
  sl.registerFactory(() => RecipeNotifier(recipeUseCases: sl()));

  // Domain layer
  sl.registerFactory(() => RecipeUseCases(recipeRepository: sl()));

  // Data layer
  sl.registerFactory<RecipeRepository>(
      () => RecipeRepositoryImpl(recipeDatasource: sl()));

  sl.registerFactory<RecipeDatasource>(() => RecipeDatasourceImpl(
          dio: Dio(BaseOptions(
        baseUrl: RestApiUrls.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'content-type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ))));
}

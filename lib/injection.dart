import 'package:chefrecipe/constants/rest_api_urls.dart';
import 'package:chefrecipe/feature/home/data/datasourcea/recipe_datasources.dart';
import 'package:chefrecipe/feature/home/data/repositories/recipe_repository.dart';
import 'package:chefrecipe/feature/home/domain/repositories/recipe_repository.dart';
import 'package:chefrecipe/feature/home/domain/usecases/recipe_usecases.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:chefrecipe/feature/search/data/datasourcea/search_datasources.dart';
import 'package:chefrecipe/feature/search/data/repositories/search_repository.dart';
import 'package:chefrecipe/feature/search/domain/repositories/search_repository.dart';
import 'package:chefrecipe/feature/search/domain/usecases/search_usecases.dart';
import 'package:chefrecipe/feature/search/presentation/notifier/search_notifier.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I; // Service location

Future<void> init() async {
  // Factory - each time a new instance of the Class

  // Presentation layer
  sl.registerFactory(() => RecipeNotifier(recipeUseCases: sl()));
  sl.registerFactory(() => SearchNotifier(searchUseCases: sl()));
  // Domain layer
  sl.registerFactory(() => RecipeUseCases(recipeRepository: sl()));
  sl.registerFactory(() => SearchUseCases(searchRepository: sl()));
  // Data layer
  sl.registerFactory<RecipeRepository>(
      () => RecipeRepositoryImpl(recipeDatasource: sl()));
  sl.registerFactory<SearchRepository>(
      () => SearchRepositoryImpl(searchDatasource: sl()));
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

  sl.registerFactory<SearchDatasource>(() => SearchDatasourceImpl(
        gemini: Gemini.instance,
      ));
}

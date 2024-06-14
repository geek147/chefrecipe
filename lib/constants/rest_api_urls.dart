import 'package:chefrecipe/core/utils/env.dart';
import 'package:dio/dio.dart';

class RestApiUrls {
  RestApiUrls._();

  static const String baseUrl = 'https://api.edamam.com/api/recipes/v2';

  static String recipeUrl(String query) {
    return "https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=${Env.appId}&app_key=${Env.appKey}";
  }

  static BaseOptions baseOptions = BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    headers: {
      'content-type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static Options options = Options(
    headers: {
      'content-type': 'application/json',
    },
    receiveTimeout: const Duration(seconds: 60),
  );
}

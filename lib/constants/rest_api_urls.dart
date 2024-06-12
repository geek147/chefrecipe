import 'package:dio/dio.dart';

class RestApiUrls {
  RestApiUrls._();

  static const String baseUrl = '';
  static const String recipeApiServerKey = '';
  static const String recipeUrl = 'https://api.edamam.com/api/recipes/v2';

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

import 'package:chefrecipe/constants/rest_api_urls.dart';
import 'package:chefrecipe/core/utils/exception.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:dio/dio.dart';

abstract class RecipeDatasource {
  Future<RecipeModel?> getRecipeFromApi(String query);
}

class RecipeDatasourceImpl implements RecipeDatasource {
  final Dio dio;

  RecipeDatasourceImpl({required this.dio});

  @override
  Future<RecipeModel?> getRecipeFromApi(String query) async {
    try {
      Response response;
      response = await dio.get(RestApiUrls.recipeUrl(query));
      if (response.statusCode != 200) {
        throw ExceptionUtils.dioStatusCodeErrorHandle(response.statusCode);
      } else {
        final model = RecipeModel.fromMap(response.data);
        return model;
      }
    } on DioException catch (e, stacktrace) {
      throw ExceptionUtils.dioErrorHandle(e, stacktrace);
    } catch (e) {
      return null;
    }
  }
}

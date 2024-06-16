import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

abstract class SearchDatasource {
  Future<String?> searchRecipeByImage(List<Uint8List> image);
  Future<String?> searchRecipeByIngredients(List<String> ingredients);
}

class SearchDatasourceImpl implements SearchDatasource {
  final Gemini gemini;
  SearchDatasourceImpl({required this.gemini});

  @override
  Future<String?> searchRecipeByImage(List<Uint8List> image) async {
    try {
      final result = await gemini.textAndImage(
          text:
              "You are a chef.Identify the dish in this image, describe it, and suggest a recipe for this dish by specifying the ingredients and the instructions on how to make it. Explain step by step with detail.",
          images: image);
      return result!.content?.parts?.last.text ?? 'No response';
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> searchRecipeByIngredients(List<String> ingredients) async {
    try {
      final result = await gemini.text(
          "You are a chef. Identify the ingredients and suggest a recipe from this ingredients. Give name to the recipe and the instructions on how to make it. Explain step by step with detail.");
      return result?.output ?? "No response";
    } catch (e) {
      return null;
    }
  }
}

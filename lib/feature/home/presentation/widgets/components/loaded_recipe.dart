import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadedRecipe extends StatelessWidget {
  final RecipeModel recipeModel;
  final WidgetRef ref;

  const LoadedRecipe({
    super.key,
    required this.recipeModel,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0), // padding around the grid
      itemCount: recipeModel.hits?.length, //
      itemBuilder: (context, index) {
        return RecipeCard(
          title: recipeModel.hits?[index].recipe?.label ?? '',
          source: recipeModel.hits?[index].recipe?.source ?? '',
          imageUrl: recipeModel.hits?[index].recipe?.image ?? '',
        );
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String source;
  final String imageUrl;

  const RecipeCard({
    super.key,
    required this.title,
    required this.source,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Source: $source',
                style: const TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

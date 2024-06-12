import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/buttons/load_more_button.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "recipeModel",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            maxLines: 8,
          ),
          LoadMoreButton(
            onTap: () {
              ref.read(recipeProvider.notifier).getRecipe();
            },
          ),
        ],
      ),
    );
  }
}

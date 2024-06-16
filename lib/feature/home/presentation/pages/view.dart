import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/failure_recipe.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/list_category.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/loaded_recipe.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/loading_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    RecipeModel? recipeModel = ref.watch(recipeProvider).recipeModel;
    Failure? failure = ref.watch(recipeProvider).failure;
    bool isLoading = ref.watch(recipeProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
            children: [
              TextSpan(
                text: 'Food ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'Recipe',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search food',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const ListCategory(),
            const Text(
              "Today's Special Dishes",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (isLoading) {
                    return const LoadingRecipe();
                  }
                  if (recipeModel != null) {
                    return LoadedRecipe(
                      recipeModel: recipeModel,
                      ref: ref,
                    );
                  } else if (failure != null) {
                    return FailureRecipe(
                      failure: failure,
                      ref: ref,
                    );
                  } else {
                    return const LoadingRecipe();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

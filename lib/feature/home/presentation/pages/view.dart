import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/failure_recipe.dart';
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
      body: Builder(
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
    );
  }
}

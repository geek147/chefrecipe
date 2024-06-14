import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/failure_recipe.dart';
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
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings, color: Colors.grey),
          ),
        ],
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryButton(
                    label: 'Chicken', imagePath: 'assets/images/no_image.png'),
                CategoryButton(
                    label: 'Burger', imagePath: 'assets/images/no_image.png'),
                CategoryButton(
                    label: 'Mushroom', imagePath: 'assets/images/no_image.png'),
              ],
            ),
            const SizedBox(height: 20),
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
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 8.0, // spacing between columns
                      ),
                      padding:
                          const EdgeInsets.all(8.0), // padding around the grid
                      itemCount: recipeModel.hits?.length, //
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          title: recipeModel.hits?[index].recipe?.label ?? '',
                          source: recipeModel.hits?[index].recipe?.source ?? '',
                          imageUrl:
                              recipeModel.hits?[index].recipe?.image ?? '',
                        );
                      },
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

class CategoryButton extends StatelessWidget {
  final String label;
  final String imagePath;

  const CategoryButton({
    super.key,
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
        ),
      ],
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

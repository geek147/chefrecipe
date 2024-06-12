import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/presentation/notifier/recipe_notifier.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/buttons/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FailureRecipe extends StatelessWidget {
  final Failure failure;
  final WidgetRef ref;

  const FailureRecipe({
    super.key,
    required this.failure,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            failure.getMessage(),
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          RefreshMoreButton(
            onTap: () {
              ref.read(recipeProvider.notifier).getRecipe();
            },
          ),
        ],
      ),
    );
  }
}

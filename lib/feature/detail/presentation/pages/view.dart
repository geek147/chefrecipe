import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final Recipe? recipe;
  const DetailView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          recipe?.label ?? 'Untitled',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: recipe?.images?.regular?.url == null
                      ? Image.network(
                          "assets/images/no_image.png",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.scaleDown,
                        )
                      : Image.network(
                          recipe?.image ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.scaleDown,
                        ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ingredients: ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              const SizedBox(height: 10),
              if (recipe?.ingredientLines != null) ...[
                for (var i = 0; i < recipe!.ingredientLines!.length; i++) ...[
                  Text(
                    recipe?.ingredientLines?[i] ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ],
              ],
              const SizedBox(height: 10),
              const Text(
                "Instructions: ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              const SizedBox(height: 10),
              Text(
                "See instruction : ${recipe?.url}",
                style: const TextStyle(fontSize: 14, fontFamily: 'Raleway'),
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  "Cuisine Type: ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
                if (recipe?.cuisineType != null) ...[
                  for (var i = 0; i < recipe!.cuisineType!.length; i++) ...[
                    Text(
                      recipe?.cuisineType?[i] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ]
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  "Health Labels: ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
                Column(
                  children: [
                    if (recipe?.healthLabels != null) ...[
                      for (var i = 0;
                          i < recipe!.healthLabels!.length;
                          i++) ...[
                        Text(
                          recipe?.healthLabels?[i] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ]
                  ],
                ),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  "Diet Labels: ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
                if (recipe?.dietLabels != null) ...[
                  for (var i = 0; i < recipe!.dietLabels!.length; i++) ...[
                    Text(
                      recipe?.dietLabels?[i] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ]
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

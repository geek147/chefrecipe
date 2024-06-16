import 'dart:math';

import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/failure_recipe.dart';
import 'package:chefrecipe/feature/search/presentation/notifier/search_notifier.dart';
import 'package:chefrecipe/feature/search/presentation/widget/loaded_search.dart';
import 'package:chefrecipe/feature/search/presentation/widget/loading_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchIngredientsView extends ConsumerStatefulWidget {
  const SearchIngredientsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchIngredientsViewState();
}

class _SearchIngredientsViewState extends ConsumerState<SearchIngredientsView> {
  late TextEditingController controller;
  late FocusNode focusNode;
  final List<String> inputTags = [];
  // String response = "";
  // final gemini = Gemini.instance;

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  // Future askAi() async {
  //   gemini
  //       .text(
  //           "You are a chef. Identify the ingredients and suggest a recipe from this ingredients. Give name to the recipe and the instructions on how to make it. Explain step by step with detail.")
  //       .then((value) => setState(() {
  //             response = value?.output ?? "No response";
  //           }))

  //       /// or value?.content?.parts?.last.text
  //       .catchError((e) => print(e));
  // }

  @override
  Widget build(BuildContext context) {
    final searchNotifier = ref.read(searchProvider.notifier);
    String? recipeIng = ref.watch(searchProvider).resultIngredients;
    Failure? failure = ref.watch(searchProvider).failure;
    bool isLoading = ref.watch(searchProvider).isLoading;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const Text(
                "Find the best recipe for this cooking",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      autofocus: true,
                      autocorrect: true,
                      controller: controller,
                      focusNode: focusNode,
                      onFieldSubmitted: (value) {
                        setState(() {
                          inputTags.add(value);
                          focusNode.requestFocus();
                        });
                        controller.clear();
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 58, 123, 92)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "Enter the ingredients you have",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 58, 123, 92),
                            fontFamily: 'Raleway'),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 58, 123, 92),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            inputTags.add(controller.text);
                            focusNode.requestFocus();
                          });
                          controller.clear();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Wrap(
                  children: [
                    for (int i = 0; i < inputTags.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(
                          backgroundColor:
                              Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                  .withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.5)),
                          label: Text(inputTags[i],
                              style: const TextStyle(fontFamily: 'Raleway')),
                          onDeleted: () {
                            setState(() {
                              inputTags.remove(inputTags[i]);
                            });
                          },
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return const LoadingSearch();
                    }
                    if (recipeIng != null) {
                      return LoadedSearch(
                        recipe: recipeIng,
                        ref: ref,
                      );
                    } else if (failure != null) {
                      return FailureRecipe(
                        failure: failure,
                        ref: ref,
                      );
                    } else {
                      return const Text(
                        "No recipe yet",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                      );
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: const Text('Get recipe'),
                  onPressed: () async {
                    searchNotifier.searchRecipeByIngredients(inputTags);
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

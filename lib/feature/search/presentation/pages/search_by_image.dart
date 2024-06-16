import 'dart:io';

import 'package:chefrecipe/core/failures/failures.dart';
import 'package:chefrecipe/feature/home/presentation/widgets/components/failure_recipe.dart';
import 'package:chefrecipe/feature/search/presentation/notifier/search_notifier.dart';
import 'package:chefrecipe/feature/search/presentation/widget/loaded_search.dart';
import 'package:chefrecipe/feature/search/presentation/widget/loading_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SearchImageView extends ConsumerStatefulWidget {
  const SearchImageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchImageViewState();
}

class _SearchImageViewState extends ConsumerState<SearchImageView> {
  File? image;
  //final gemini = Gemini.instance;

  Future pickImage(ImageSource source) async {
    try {
      final image1 = await ImagePicker().pickImage(source: source);
      if (image1 == null) return;
      final imageTemp = File(image1.path);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _showPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(ImageSource.camera);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchNotifier = ref.read(searchProvider.notifier);
    String? recipe = ref.watch(searchProvider).resultImage;
    Failure? failure = ref.watch(searchProvider).failure;
    bool isLoading = ref.watch(searchProvider).isLoading;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          "Pick Image from Camera or Gallery",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
        ),
        const SizedBox(height: 10),
        Card(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () {
              _showPickerDialog();
            },
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: image == null
                  ? Image.asset(
                      "assets/images/no_image.png",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                    )
                  : Image.file(
                      image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        MaterialButton(
          color: Colors.blue,
          onPressed: () {
            if (image != null) {
              searchNotifier.searchRecipeByImage([image!.readAsBytesSync()]);
            }
          },
          child: const Text("Ask Ai for Recipe",
              style: TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Builder(
            builder: (context) {
              if (isLoading) {
                return const LoadingSearch();
              }
              if (recipe != null) {
                return LoadedSearch(
                  recipe: recipe,
                  ref: ref,
                );
              } else if (failure != null) {
                return FailureRecipe(
                  failure: failure,
                  ref: ref,
                );
              } else {
                return const Text(
                  "No Image Selected",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                );
              }
            },
          ),
        )
      ],
    );
  }
}

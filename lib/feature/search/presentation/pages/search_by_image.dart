import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
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
  final gemini = Gemini.instance;
  String? recipe;

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

  Future askAiImage() async {
    gemini
        .textAndImage(
            text:
                "You are a chef.Identify the dish in this image, describe it, and suggest a recipe for this dish by specifying the ingredients and the instructions on how to make it. Explain step by step with detail.",
            images: [image!.readAsBytesSync()])
        .then((value) => setState(() {
              recipe = value?.content?.parts?.last.text ?? '';
            }))
        .catchError((e) => print('textAndImageInput $e'));
  }

  @override
  Widget build(BuildContext context) {
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
            askAiImage();
          },
          child: const Text("Ask Ai for Recipe",
              style: TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    recipe ?? "No recipe found",
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontFamily: 'Raleway'),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

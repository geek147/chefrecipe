import 'package:chefrecipe/feature/detail/presentation/pages/view.dart';
import 'package:chefrecipe/feature/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Recipe? recipe;

  const DetailPage({super.key, required this.recipe});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return DetailView(
      recipe: widget.recipe,
    );
  }
}

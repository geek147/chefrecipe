import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadedSearch extends StatelessWidget {
  final String recipe;
  final WidgetRef ref;

  const LoadedSearch({
    super.key,
    required this.recipe,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              recipe,
              style: const TextStyle(
                  fontSize: 16.0, color: Colors.black87, fontFamily: 'Raleway'),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

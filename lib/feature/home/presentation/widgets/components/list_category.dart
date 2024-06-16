import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListCategory extends ConsumerWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final contentHeight = 4.0 * (MediaQuery.of(context).size.width / 2.4) / 4;
    final List<String> listCuisine = [
      'Chicken',
      'Duck',
      'Beef',
      'Fish',
      'Vegetarian',
      'Seafood',
    ];

    return SizedBox(
      height: contentHeight,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CategoryButton(
              label: listCuisine[index],
              imagePath: 'assets/images/no_image.png');
        },
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 6.0,
        ),
        itemCount: listCuisine.length,
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

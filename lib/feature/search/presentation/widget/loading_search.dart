import 'package:chefrecipe/feature/search/presentation/widget/skeleton.dart';
import 'package:flutter/material.dart';

class LoadingSearch extends StatelessWidget {
  const LoadingSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SkeletonWidget(
                width: size.width,
                height: 16,
              ),
              const SizedBox(
                height: 8,
              ),
              SkeletonWidget(
                width: size.width * 0.70,
                height: 16,
              ),
              const SizedBox(
                height: 8,
              ),
              SkeletonWidget(
                width: size.width * 0.80,
                height: 16,
              ),
              const SizedBox(
                height: 8,
              ),
              SkeletonWidget(
                width: size.width * 0.76,
                height: 16,
              ),
            ],
          ),
          const SkeletonWidget(
            width: 54,
            height: 54,
            borderRadius: 48,
          ),
        ],
      ),
    );
  }
}

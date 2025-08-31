import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/shimmers/shimmer_loader.dart';

class AbListTileShimmer extends StatelessWidget {
  const AbListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            AbShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: AbSizes.spaceBtwItems),
            Column(
              children: [
                AbShimmerEffect(width: 100, height: 15),
                SizedBox(width: AbSizes.spaceBtwItems / 2),
                AbShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
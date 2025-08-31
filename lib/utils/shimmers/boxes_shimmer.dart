import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/shimmers/shimmer_loader.dart';

class AbBoxesShimmer extends StatelessWidget {
  const AbBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: AbShimmerEffect(width: 150, height: 110)),
            SizedBox(width: AbSizes.spaceBtwItems),
            Expanded(child: AbShimmerEffect(width: 150, height: 110)),
            SizedBox(width: AbSizes.spaceBtwItems),
            Expanded(child: AbShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
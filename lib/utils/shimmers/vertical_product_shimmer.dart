import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/shimmers/shimmer_loader.dart';

class AbVerticalProductShimmer extends StatelessWidget {
  const AbVerticalProductShimmer({
    super.key, 
    this.itemCount = 4
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AbGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, _) => const SizedBox(
        width: 180,
        child: Column(
          children: [
            /// Image
            AbShimmerEffect(width: 180, height: 180),
            SizedBox(height: AbSizes.spaceBtwItems),

            /// Text
            AbShimmerEffect(width: 160, height: 15),
            SizedBox(height: AbSizes.spaceBtwItems / 2),
            AbShimmerEffect(width: 110, height: 15),

          ],
        ),
      ),
    );
  }
}
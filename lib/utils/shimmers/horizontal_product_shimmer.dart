import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/shimmers/shimmer_loader.dart';

class AbHorizontalProductShimmer extends StatelessWidget {
  const AbHorizontalProductShimmer({super.key, this.itemCount = 4 });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: AbSizes.spaceBtwItems), 
        itemBuilder: (_, _) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AbShimmerEffect(width: 120, height: 120),
            SizedBox(width: AbSizes.spaceBtwItems),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AbSizes.spaceBtwItems / 2),
                AbShimmerEffect(width: 160, height: 15),
                SizedBox(height: AbSizes.spaceBtwItems / 2),
                AbShimmerEffect(width: 110, height: 15),
                SizedBox(height: AbSizes.spaceBtwItems / 2),
                AbShimmerEffect(width: 80, height: 15)
              ],
            )
          ],
        ), 
        
      ),
    );
  }
}
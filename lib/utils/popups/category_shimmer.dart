import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';

class AbCategoryShimmer extends StatelessWidget {
  const AbCategoryShimmer({
    super.key, 
    this.itemCount = 6
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => const SizedBox(width: AbSizes.spaceBtwItems),
        itemBuilder: (_, _) {
          return const Column(
            children: [
              /// Image 
              AbShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: AbSizes.spaceBtwItems / 2),

              /// Text
              AbShimmerEffect(width: 55, height: 8),
            ],
          );
        },  ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AbSizes.defaultSpace / 2,
        horizontal: AbSizes.defaultSpace
      ),
      decoration: BoxDecoration(
        color: dark ? AbColors.darkerGrey : AbColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AbSizes.cardRadiusLg),
          topRight: Radius.circular(AbSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AbCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AbColors.darkerGrey,
                width: 40,
                height: 40,
                color: AbColors.white,
                ),
              const SizedBox(width: AbSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AbSizes.spaceBtwItems),
              const AbCircularIcon(
                icon: Iconsax.add,
                backgroundColor: AbColors.black,
                width: 40,
                height: 40,
                color: AbColors.white,
                ),
            ]
          ),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AbSizes.md),
              backgroundColor: AbColors.black,
              side: const BorderSide(color: AbColors.black)
            ),
            child: const Text('Add to cart'),
            )
        ],
      ),
    );
  }
}
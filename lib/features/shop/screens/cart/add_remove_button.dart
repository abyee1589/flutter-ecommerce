import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbProductQuantityWithAddRemoveButton extends StatelessWidget {
  const AbProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AbCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AbSizes.md,
          color: dark ? AbColors.white : AbColors.black,
          backgroundColor: dark ? AbColors.darkerGrey : AbColors.light,
          onPressed: (){}
        ),
        const SizedBox(width: AbSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AbSizes.spaceBtwItems),
        AbCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AbSizes.md,
          color: AbColors.white,
          backgroundColor: AbColors.primary,
          onPressed: (){}
        ),
      ],
    );
  }
}


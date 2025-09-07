import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbProductQuantityWithAddRemoveButton extends StatelessWidget {
  const AbProductQuantityWithAddRemoveButton({super.key, required this.quantity, this.add, this.remove});
  final int quantity;
  final VoidCallback? add, remove;

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
          onPressed: remove,
        ),
        const SizedBox(width: AbSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AbSizes.spaceBtwItems),
        AbCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AbSizes.md,
          color: AbColors.white,
          backgroundColor: AbColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}

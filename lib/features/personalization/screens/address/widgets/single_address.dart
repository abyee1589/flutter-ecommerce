import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbSingleAddress extends StatelessWidget {
  const AbSingleAddress({
    super.key,
    required this.selectedAddress
  });

    final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return AbRoundedContainer(
      padding: const EdgeInsets.all(AbSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? AbColors.primary.withOpacity(0.8) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? AbColors.darkerGrey : AbColors.grey,
      margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress ? dark ? AbColors.light : AbColors.dark : null,
              ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abdi Bekele',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AbSizes.sm / 2),
              const Text('+251-915-948189', maxLines: 1, overflow: TextOverflow.ellipsis),
              const Text(
                'Melka Gefersa, Sheggar, Addis Ababa, Ethiopia',
                softWrap: true,
              ),
              const SizedBox(height: AbSizes.sm / 2),
            ],
          )
        ],
      ),
    );
  }
}
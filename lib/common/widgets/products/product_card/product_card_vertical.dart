import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/shadows.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbProductCardVertical extends StatelessWidget {
  const AbProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [AbShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(AbSizes.productImageRadius),
        color: dark ? AbColors.darkGrey : AbColors.white,
      ),
      child: Column(
        children: [
          RoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(AbSizes.sm),
            backgroundColor: dark ? AbColors.dark : AbColors.light,
            child: const Stack(
              children: [
                /// Thubnail image
                AbRoundedImage(imageUrl: AbImages.productImage1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


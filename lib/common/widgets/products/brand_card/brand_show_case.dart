import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbBrandshowcase extends StatelessWidget {
  const AbBrandshowcase({
    super.key, 
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      showBorder: false,
      borderColor: AbColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(right: AbSizes.spaceBtwItems),
      padding: const EdgeInsets.all(AbSizes.md),
      child: Column(children: [
        // const AbBrandCard(showBorder: false),
        Row(children: images.map((image) => brandToProductImageWidget(image, context)).toList())
      ]),
    );
  }
}

Widget brandToProductImageWidget (String image, context) {
  return AbRoundedContainer(
    height: 100,
    backgroundColor: AbHelperFunctions.isDarkMode(context) ? AbColors.darkGrey : AbColors.white,
    margin: const EdgeInsets.only(right: AbSizes.sm),
    padding: const EdgeInsets.all(AbSizes.md),
    child: const Image(fit: BoxFit.contain, image: AssetImage(AbImages.clothIcon))
  );
}


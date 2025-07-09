import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbBrandCard extends StatelessWidget {
  const AbBrandCard({
    super.key, 
    this.onTap, 
    required this.showBorder
  });

  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: AbRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(AbSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AbCircularImage(
                image: AbImages.clothIcon, 
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? AbColors.white : AbColors.black,
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwItems / 2),

            /// Texts
            const Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AbBrandTextWithVerifiedIcon(title: 'T-shirt', brandTextSize: TextSizes.large),
                Text('25 product')
              ],
            ))
        ],),
      ),
    );
  }
}
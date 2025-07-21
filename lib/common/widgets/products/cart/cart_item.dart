import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbCartItem extends StatelessWidget {
  const AbCartItem({
    super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image 
        AbRoundedImage(
          imageUrl: AbImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AbSizes.sm),
          backgroundColor: dark ? AbColors.darkerGrey : AbColors.light,
        ),
        const SizedBox(width: AbSizes.spaceBtwItems),
    
        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AbBrandTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: AbProductTitleText(title: 'Black Sport shoes', maxLines: 1)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}
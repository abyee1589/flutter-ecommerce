import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbProductMetaData extends StatelessWidget {
  const AbProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & sale price
        Row(
          children: [
            /// Sale tag
             AbRoundedContainer(
              radius: AbSizes.sm,
              backgroundColor: AbColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: AbSizes.sm, vertical: AbSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AbColors.black),),
             ),
             const SizedBox(width: AbSizes.spaceBtwItems),

            ///  Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: AbSizes.spaceBtwItems ),
            const AbProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

        /// Title
        const AbProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

        /// Stock status
        Row(
          children: [
            const AbProductTitleText(title: 'Status'),
            const SizedBox(width: AbSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            AbCircularImage(
              image: AbImages.clothIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? AbColors.white : AbColors.black,
              ),
            const AbBrandTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbProductCardHorizontal extends StatelessWidget {
  const AbProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AbSizes.productImageRadius),
        color: dark ? AbColors.darkerGrey : AbColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thubnail
          AbRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(AbSizes.sm),
            backgroundColor: dark ? AbColors.dark : AbColors.light,
            child: Stack(
              children: [
                /// Thubnail image 
                const SizedBox(
                  // width: 120, 
                  height: 120, 
                  child: AbRoundedImage(
                    imageUrl: AbImages.productImage1, 
                    applyImageRadius: true,
                  ),
                ),
                /// Sale tag
                Positioned(
                  top: 3,
                  child: AbRoundedContainer(
                    radius: AbSizes.sm,
                    backgroundColor: AbColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: AbSizes.sm, vertical: AbSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AbColors.black),),
                  ),
                ),
      
                /// Favourite Icoon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: AbCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ), 
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: AbSizes.sm, left: AbSizes.sm),
              child: Column(
                children: [
                  const Column(
                    children: [
                      /// Title & Subtitle
                      AbProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true,),
                      SizedBox(height: AbSizes.spaceBtwItems / 2),
                      AbBrandTextWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: AbProductPriceText(price: '256.0')),
                      
                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: AbColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AbSizes.cardRadiusMd),
                            bottomRight: Radius.circular(AbSizes.productImageRadius)
                            )
                        ),
                        child: const SizedBox(
                          width: AbSizes.iconLg * 1.2,
                          height: AbSizes.iconLg * 1.2,
                          child: Icon(Iconsax.add, color: AbColors.white,)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )   
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/shadows.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbProductCardVertical extends StatelessWidget {
  const AbProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductdetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AbShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AbSizes.productImageRadius),
          color: dark ? AbColors.darkerGrey : AbColors.white,
        ),

        /// Thubnail, Wishlist Button, Discount Tag
        child: Column(
          children: [
            AbRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AbSizes.sm),
              backgroundColor: dark ? AbColors.dark : AbColors.light,
              child: Stack(
                children: [

                  /// Thubnail image
                  const AbRoundedImage(imageUrl: AbImages.productImage1, applyImageRadius: true,),
                  
                  /// Sale tag
                  Positioned(
                    top: 7,
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
                    child: AbCircularIcon(icon: Iconsax.heart5, color: Colors.red)
                  ),
                ],
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwItems / 2),

            /// Product Details
            const Padding(
              padding: EdgeInsetsGeometry.only(left: AbSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbProductTitleText(title: 'Nike Air Shoes', smallSize: true),
                  SizedBox(height: AbSizes.spaceBtwItems / 2),
                  AbBrandTextWithVerifiedIcon(title: 'Nike',),
                ],
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                /// Price 
                const Padding(
                  padding: EdgeInsets.only(left: AbSizes.sm),
                  child: AbProductPriceText(price: '35.0'),
                ),

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
            ),
          ],
        ),
      ),
    );
  }
}





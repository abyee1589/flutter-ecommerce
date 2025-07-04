import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/shadows.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbProductCardVertical extends StatelessWidget {
  const AbProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AbShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AbSizes.productImageRadius),
          color: dark ? AbColors.darkGrey : AbColors.white,
        ),
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
                  
                  /// Sale
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
            /// Details
            Padding(
              padding: const EdgeInsetsGeometry.only(left: AbSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AbProductTitleText(title: 'Nike Air Shoes', smallSize: true),
                  const SizedBox(height: AbSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(width: AbSizes.xs),
                      const Icon(Iconsax.verify5, color: AbColors.primary, size: AbSizes.iconXs,)
                    ],
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Text(
                        '\$35.5',
                        overflow: TextOverflow.ellipsis, 
                        maxLines: 1, 
                        style: Theme.of(context).textTheme.headlineMedium
                      ),
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
          ],
        ),
      ),
    );
  }
}




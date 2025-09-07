import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbProductCardHorizontal extends StatelessWidget {
  const AbProductCardHorizontal({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = AbHelperFunctions.isDarkMode(context);
    return Container(
      width: 300,
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
                SizedBox(
                  // width: 120,
                  height: 120,
                  child: AbRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                ),

                /// Sale tag
                if(salePercentage !=null)
                  Positioned(
                    top: 3,
                    child: AbRoundedContainer(
                      radius: AbSizes.sm,
                      backgroundColor: AbColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: AbSizes.sm, vertical: AbSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AbColors.black)),
                    ),
                  ),

                /// Favourite Icoon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: AbFavouriteIcon(productId: product.id)
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: AbSizes.sm, left: AbSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title & Subtitle
                      AbProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: AbSizes.spaceBtwItems / 2),
                      AbBrandTextWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: AbSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            AbProductPriceText(price: controller.getProductPrice(product)),
                          ],
                        ),
                      ),
            
                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: AbColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AbSizes.cardRadiusMd),
                            bottomRight: Radius.circular(AbSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: AbSizes.iconLg * 1.2,
                          height: AbSizes.iconLg * 1.2,
                          child: Icon(Iconsax.add, color: AbColors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbProductMetaData extends StatelessWidget {
  const AbProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
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
              padding: const EdgeInsets.symmetric(
                horizontal: AbSizes.sm,
                vertical: AbSizes.xs,
              ),
              child: Text(
                '$salePercentage%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: AbColors.black),
              ),
            ),
            const SizedBox(width: AbSizes.spaceBtwItems),

            ///  Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '${product.price}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: AbSizes.spaceBtwItems),
            AbProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

        /// Title
        AbProductTitleText(title: product.title),
        const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

        /// Stock status
        Row(
          children: [
            const AbProductTitleText(title: 'Status'),
            const SizedBox(width: AbSizes.spaceBtwItems),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            AbCircularImage(
              imageUrl: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? AbColors.white : AbColors.black,
            ),
            AbBrandTextWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}

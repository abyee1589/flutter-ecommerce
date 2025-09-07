import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AbSizes.defaultSpace / 2,
        horizontal: AbSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: dark ? AbColors.darkerGrey : AbColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AbSizes.cardRadiusLg),
          topRight: Radius.circular(AbSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AbCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: AbColors.darkerGrey,
                  width: 40,
                  height: 40,
                  color: AbColors.white,
                  onPressed: () => cartController.productQuantityInCart.value > 0
                      ? cartController.productQuantityInCart.value -= 1 
                      : null,
                ),
                const SizedBox(width: AbSizes.spaceBtwItems),
                Text(
                  cartController.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: AbSizes.spaceBtwItems),
                AbCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: AbColors.black,
                  width: 40,
                  height: 40,
                  color: AbColors.white,
                  onPressed: () => cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AbSizes.md),
                backgroundColor: AbColors.black,
                side: const BorderSide(color: AbColors.black),
              ),
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}

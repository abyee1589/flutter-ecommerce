import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCart extends StatelessWidget {
  const ProductCardAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductdetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(
          product.id,
        );
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? AbColors.primary : AbColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AbSizes.cardRadiusMd),
              bottomRight: Radius.circular(AbSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: AbSizes.iconLg * 1.2,
            height: AbSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(color: AbColors.white),
                    )
                  : const Icon(Iconsax.add, color: AbColors.white),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/features/shop/screens/cart/cart.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbCartCounterIcon extends StatelessWidget {
  const AbCartCounterIcon({
    super.key,
    this.iconColor,
    this.onPressed,
    this.counterBgColor,
    this.counterTextColor,
  });
  final VoidCallback? onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final cartController = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: AbColors.white,
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? AbColors.white : AbColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Obx(
              () => Text(
                cartController.noOfCartItems.value.toString(),
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: AbColors.white,
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

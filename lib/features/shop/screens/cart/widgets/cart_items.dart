import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/features/shop/screens/cart/add_remove_button.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AbCartItems extends StatelessWidget {
  const AbCartItems({super.key, this.showActionButtons = true});
  final bool showActionButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() {
      final cartItems = cartController.cartItems;
      return ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, _) =>
            const SizedBox(height: AbSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartItems[index];
          return Column(
            children: [
              /// Cart Item
              AbCartItem(cartItem: item),
              if (showActionButtons)
                const SizedBox(height: AbSizes.spaceBtwItems),

              /// Add Remove Button Row with Item Price
              if (showActionButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra space
                        const SizedBox(width: 70),

                        /// Add Remove Buttons
                        AbProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    /// Product total price
                    AbProductPriceText(
                      price: (item.quantity * item.price).toStringAsFixed(0),
                    ),
                  ],
                ),
            ],
          );
        }),
      );
    });
  }
}

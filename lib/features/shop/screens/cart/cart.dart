import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: AbAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (cartController.cartItems.isEmpty) {
            return Center(
              child: Text(
                'Cart is empty!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AbSizes.defaultSpace),
              /// Items in cart
              child: AbCartItems(),
            ),
          );
        }),
      ),

      /// Checkout Button
      bottomNavigationBar: Obx(() {
        if(cartController.cartItems.isEmpty) return const SizedBox();
        return Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text('Checkout \$${cartController.totalCartPrice.value}'),
          ),
        );
      })
    );
  }
}

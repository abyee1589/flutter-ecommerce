

import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/data/repositories/order/order_repository.dart';
import 'package:flutter_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_app/features/shop/models/order_model.dart';
import 'package:flutter_app/navigation_menu.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/loaders/full_screen_loader.dart';
import 'package:flutter_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables 
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final addressController = AddressController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try{
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch(e){
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async{
    try {
      AbFullScreenLoader.openLoadingDialog('Processing Order...', AbImages.lottieAnimation);

      final userId = AuthenticationRepository.instance.authUser.uid;

      if(userId.isEmpty) return;
      final order = OrderModel(
        id: UniqueKey().toString(), 
        userId: userId!,
        status: OrderStatus.pending,
        totalAmount: totalAmount, 
        orderDate: DateTime.now(), 
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList()
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.offAll(() => SuccessScreen(
        image: AbImages.success, 
        title: 'payment Success!', 
        subTitle: 'Your item will be shipped soon!', 
        onPressed: () => Get.offAll(() => const NavigationMenu())));
    }catch(e){
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      AbFullScreenLoader.stopLoading();
    }
  }
}
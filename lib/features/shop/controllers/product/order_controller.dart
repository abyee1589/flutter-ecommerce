import 'package:flutter_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_app/data/chapa_payment_service.dart';
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
import 'package:url_launcher/url_launcher.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final addressController = AddressController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<void> openCheckout(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception("Could not launch $url");
    }
  }

  Future<void> processOrder(double totalAmount) async {
    try {
      AbFullScreenLoader.openLoadingDialog(
        'Processing Order...',
        AbImages.lottieAnimation,
      );

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) throw Exception("User not logged in");
      final user = AuthenticationRepository.instance.authUser;

      // 1. Create a ChapaPaymentService instance
      final txRef = "TX-${DateTime.now().millisecondsSinceEpoch}";
      final chapaService = ChapaPaymentService(
        amount: totalAmount.toString(),
        currency: "ETB",
        email: user.email.toString(), // TODO: replace with logged-in user email
        firstName: user.displayName?.split(' ').first ?? 'First', // TODO: replace with user profile data
        lastName:  user.displayName?.split(' ').last ?? 'Last',
        txRef: txRef,
        callbackUrl: "https://google.com",
      );

      // 2. Initialize payment with Chapa
      final checkoutUrl = await chapaService.initializePayment();
      if (checkoutUrl == null) throw Exception("Payment initialization failed");

      // 3. Open checkout page
      await openCheckout(checkoutUrl); // You'll need url_launcher or WebView

      // 4. Verify payment
      final verified = await chapaService.verifyPayment(txRef);
      if (!verified) throw Exception("Payment not verified");

      // 5. Save order
      final order = OrderModel(
        id: txRef,
        userId: userId,
        status: verified ? OrderStatus.processing : OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);
      cartController.clearCart();

      // 6. Navigate to success screen
      Get.offAll(
        () => SuccessScreen(
          image: AbImages.success,
          title: 'Payment Success!',
          subTitle: 'Your item will be shipped soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      AbFullScreenLoader.stopLoading();
    }
  }
}

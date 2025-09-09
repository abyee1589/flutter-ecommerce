import 'package:flutter_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_app/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(CheckoutController());
    Get.put(AddressController());
  }
}

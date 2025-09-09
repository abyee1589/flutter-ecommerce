import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/lis_tiles/payment_tile.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/models/payment_method_model.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(
      name: 'Paypal',
      image: AbImages.paypal,
    );
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(child: Container(
        padding: const EdgeInsets.all(AbSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AbSectionHeading(title: 'Select Payment Method'),
            const SizedBox(height: AbSizes.spaceBtwSections),
            AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: AbImages.paypal)),
            const SizedBox(height: AbSizes.spaceBtwItems),
            AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: AbImages.googlePay)),
            const SizedBox(height: AbSizes.spaceBtwItems),
            AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: AbImages.applePay)),
            const SizedBox(height: AbSizes.spaceBtwItems),
            AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: AbImages.visa)),
            const SizedBox(height: AbSizes.spaceBtwItems),
            AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: AbImages.masterCard)),
            const SizedBox(height: AbSizes.spaceBtwItems),
            // AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: AbImages.paytm)),
            // const SizedBox(height: AbSizes.spaceBtwItems),
            // AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: AbImages.payStack)),
            // const SizedBox(height: AbSizes.spaceBtwItems),
            // AbPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: AbImages.creditcard)),
            // const SizedBox(height: AbSizes.spaceBtwItems),
          ],
        ),
      )),
    );
  }
}

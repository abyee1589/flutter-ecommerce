import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_app/features/shop/models/payment_method_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class AbPaymentTile extends StatelessWidget {
  const AbPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override 
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final checkoutController = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        checkoutController.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: AbRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: dark ? AbColors.light : AbColors.white,
        padding: const EdgeInsets.all(AbSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34)
    );
  }
}
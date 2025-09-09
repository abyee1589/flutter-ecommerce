import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class AbBillingPaymentSection extends StatelessWidget {
  const AbBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final checkoutController = Get.put(CheckoutController());
    return Column(
      children: [
        AbSectionHeading(title: 'Payment Methods', buttonTitle: 'Change', showActionButton: true, onPressed: () => checkoutController.selectPaymentMethod(context)),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              AbRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? AbColors.light : AbColors.white,
                padding: const EdgeInsets.all(AbSizes.sm),
                child: Image(image: AssetImage(checkoutController.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: AbSizes.spaceBtwItems / 2),
              Text(checkoutController.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}

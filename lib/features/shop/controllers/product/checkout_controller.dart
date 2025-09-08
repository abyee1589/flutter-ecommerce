import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/models/payment_method_model.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CkeckoutController extends GetxController {
  static CkeckoutController get instance => Get.find();

  Rx<PaymentMethodModel> selectPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectPaymentMethod.value = PaymentMethodModel(
      name: 'Paypal',
      image: AbImages.paypal,
    );
    super.onInit();
  }

  // Future<dynamic> selectPaymentMethod(BuildContext context) {
  //   return showModalBottomSheet(
  //     context: context,
  //     builder: (_) => SingleChildScrollView(child: Container(
  //       padding: const EdgeInsets.all(AbSizes.lg),
  //       child: const Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           AbSectionHeading(title: 'Select Payment Method'),
  //           SizedBox(height: AbSizes.spaceBtwSections),
  //           AbPaymentTitle()
  //         ],
  //       ),
  //     )),
  //   );
  // }
}

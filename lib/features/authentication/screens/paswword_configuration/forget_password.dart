import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key, 
    this.image, 
    this.title, 
    this.subTitle});
  final String? title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (() => Get.back()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AbSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title and Subtitle
            Text(AbTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
            const SizedBox(height: AbSizes.spaceBtwItems),
            Text(AbTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: AbSizes.spaceBtwSections * 2),
        
            /// Text fields
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => AbValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: AbTexts.email, prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwSections),
        
            /// Submit button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(AbTexts.submit))),
        
          ],
        )),
    );
  }
}
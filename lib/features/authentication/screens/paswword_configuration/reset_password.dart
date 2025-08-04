import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key, required this.email
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (() => Get.back()), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60% of the width
              Image(image: const AssetImage(AbImages.deliveredEmailIllustration), width: AbHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Title and Subtitle
              Text(email, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Text(AbTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Text(AbTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Buttons
              SizedBox( width: double.infinity, child: ElevatedButton(onPressed: (() => Get.off(() => const LoginScreen())), child: const Text(AbTexts.done))),
              const SizedBox(height: AbSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(AbTexts.resendEmail))),

            ],
          ),
        )
      ),
    );
  }
}
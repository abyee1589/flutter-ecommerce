import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key, 
    this.email
  });
  
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(AbImages.onBoardingImage1), width: AbHelperFunctions.screenHeight() * 0.6),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Title and SubTitle
              Text(AbTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Text(AbTexts.confirmEmailSubTItle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: (()  => controller.checkEmailVerificationStatus()),
                  child: const Text(AbTexts.abContinue))
              ),
              const SizedBox(height: AbSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(AbTexts.reSendEmail))),
            ],
          ),
        )
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(AbImages.onBoardingImage1), width: AbHelperFunctions.screenHeight() * 0.6),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Title and SubTitle
              Text(AbTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Text('Supper interesting one', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Text(AbTexts.confirmEmailSubTItle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: (() => Get.to(SuccessScreen( 
                    image: AbImages.productdsIllustration, 
                    title: AbTexts.passwordEmailSentTitle, 
                    subTitle: AbTexts.passwordEmailSentTitle, 
                    onPressed: (() => Get.to(const LoginScreen())),))),
                  child: const Text(AbTexts.done))
              ),
              const SizedBox(height: AbSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (() {}), child: Text(AbTexts.reSendEmail))),
            ],
          ),
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/spacing_style.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AbSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(children: [

          /// Image
          Image(image: AssetImage(image), width: AbHelperFunctions.screenHeight() * 0.6),
          const SizedBox(height: AbSizes.spaceBtwSections),

          /// Title and SubTitle
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
          const SizedBox(height: AbSizes.spaceBtwItems),
          Text('Supper interesting one', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
          const SizedBox(height: AbSizes.spaceBtwItems),
          Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
          const SizedBox(height: AbSizes.spaceBtwSections),

          /// Buttons
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (() => Get.to(const LoginScreen())), child: Text(AbTexts.done))),
          const SizedBox(height: AbSizes.spaceBtwItems),
          SizedBox(width: double.infinity, child: TextButton(onPressed: (() {}), child: Text(AbTexts.reSendEmail))),
        ]),
      ),
    );
  }
}
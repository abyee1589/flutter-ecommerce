import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (() => Get.back()), icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60% of the width
              Image(image: AssetImage(AbImages.deliveredEmailIllustration), width: AbHelperFunctions.screenWidth() * 0.6),
              SizedBox(height: AbSizes.spaceBtwSections),

              /// Title and Subtitle
              Text(AbTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: AbSizes.spaceBtwItems),
              Text(AbTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: AbSizes.spaceBtwSections),

              /// Buttons
              
              SizedBox( width: double.infinity, child: ElevatedButton(onPressed: (() => Get.off(() => LoginScreen())), child: Text(AbTexts.done))),
              SizedBox(height: AbSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (() {}), child: Text(AbTexts.resendEmail))),

            ],
          ),
        )
      ),
    );
  }
}
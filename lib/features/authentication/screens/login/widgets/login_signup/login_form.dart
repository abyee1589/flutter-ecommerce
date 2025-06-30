import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/screens/paswword_configuration/forget_password.dart';
import 'package:flutter_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter_app/navigation_menu.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbLoginForm extends StatelessWidget {
  const AbLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AbSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right,), 
                  labelText: AbTexts.email,
                ),
              ),
              const SizedBox(height: AbSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check,),
                  labelText: AbTexts.newPassword,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: AbSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true, 
                        onChanged: (value) {}),
                      const Text(AbTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => ForgetPassword(image: AbImages.onBoardingImage1, title: AbTexts.forgetPassword, subTitle: AbTexts.abContinue)), 
                    child: const Text(AbTexts.forgetPassword)
                  )
                ],
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (() => Get.to(() => NavigationMenu())), 
                  child: Text(AbTexts.signIn)
                  ),
                ),
              const SizedBox(height: AbSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => SignupScreen()), 
                  child: Text(AbTexts.createAccount)
                ),
              ),
            ],
          )
        )
    );
  }
}


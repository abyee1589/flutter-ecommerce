import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_app/features/authentication/screens/paswword_configuration/forget_password.dart';
import 'package:flutter_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbLoginForm extends StatelessWidget {
  const AbLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AbSizes.spaceBtwSections),
          child: Column(
            children: [

              /// Email
              TextFormField(
                controller: controller.email,
                validator: (value) => AbValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right,), 
                  labelText: AbTexts.email,
                ),
              ),
              const SizedBox(height: AbSizes.spaceBtwInputFields),

              /// Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => AbValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,  /// Observes the password to show or hide it
                  decoration: InputDecoration(
                    labelText: AbTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
                  ),
                ),
              ),
              const SizedBox(height: AbSizes.spaceBtwInputFields / 2),

              /// Remeber me and Forget Password Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [

                      /// Remember me
                      Obx(
                        () =>  Checkbox(
                          value: controller.rememberMe.value, 
                          onChanged: ((value) => controller.rememberMe.value = !controller.rememberMe.value)
                        ),
                      ),
                      const Text(AbTexts.rememberMe),
                    ],
                  ),

                  /// Forget Password Button
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword(image: AbImages.onBoardingImage1, title: AbTexts.forgetPassword, subTitle: AbTexts.abContinue)), 
                    child: const Text(AbTexts.forgetPassword)
                  )
                ],
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Signin Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(), 
                  child: const Text(AbTexts.signIn)
                  ),
                ),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Signup Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()), 
                  child: const Text(AbTexts.createAccount)
                ),
              ),
            ],
          )
        )
    );
  }
}


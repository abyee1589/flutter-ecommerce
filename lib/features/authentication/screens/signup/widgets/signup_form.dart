import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbSignupForm extends StatelessWidget {
  const AbSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => AbValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: AbTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: AbSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => AbValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: AbTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => AbValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: AbTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: AbSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => AbValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: AbTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: AbSizes.spaceBtwInputFields),
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
          const SizedBox(height: AbSizes.spaceBtwSections),
          const AbTermsAndConditionsCheckbox(),
          const SizedBox(height: AbSizes.spaceBtwSections),
    
          /// Signup Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (() => controller.signup()), child: const Text(AbTexts.createAccount)),)
        ],
      ),
    );
  }
}


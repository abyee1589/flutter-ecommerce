import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbSignupForm extends StatelessWidget {
  const AbSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            decoration: const InputDecoration(
              labelText: AbTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: AbSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: AbTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: AbSizes.spaceBtwInputFields),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: AbTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)
            ),
          ),
          const SizedBox(height: AbSizes.spaceBtwSections),
          const AbTermsAndConditionsCheckbox(),
          const SizedBox(height: AbSizes.spaceBtwSections),
    
          /// Signup Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (() => Get.to(const VerifyEmailScreen())), child: const Text(AbTexts.createAccount)),)
        ],
      ),
    );
  }
}


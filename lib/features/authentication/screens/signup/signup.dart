import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/form_divider.dart';
import 'package:flutter_app/common/widgets/social_buttons.dart';
import 'package:flutter_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AbTexts.signupTtle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AbSizes.spaceBtwItems),
              const AbSignupForm(),
              /// Divider
              const SizedBox(height: AbSizes.spaceBtwSections),
              AbFormDivider(dividerText: AbTexts.orSignUpWith.capitalize!),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Social Buttons
              const AbSocialButtons(),
            ],
          ),
        )
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/form_divider.dart';
import 'package:flutter_app/common/widgets/social_buttons.dart';
import 'package:flutter_app/features/authentication/screens/login/widgets/login_signup/login_form.dart';
import 'package:flutter_app/features/authentication/screens/login/widgets/login_signup/login_header.dart';
import 'package:flutter_app/common/style/spacing_style.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
              child: Padding(
                padding: AbSpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  children: [
                  /// Log, Title, Sub-title
                    AbLoginHeader(dark: dark),
                    const AbLoginForm(),
                    AbFormDivider(dividerText: AbTexts.orSignInWith.capitalize!),
                    const SizedBox(height: AbSizes.spaceBtwSections),
                    const AbSocialButtons(),
                  ],
                ),
              ),
      ),
    );
  }
}




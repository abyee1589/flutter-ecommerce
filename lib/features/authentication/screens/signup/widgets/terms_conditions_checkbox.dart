import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class AbTermsAndConditionsCheckbox extends StatelessWidget {
  const AbTermsAndConditionsCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = AbHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: ((value) => controller.privacyPolicy.value = !controller.privacyPolicy.value)))),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: '${AbTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: AbTexts.privacyPolicy, 
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? AbColors.white : AbColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? AbColors.white : AbColors.primary,
              ),
            ),
            TextSpan(text: ' ${AbTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: AbTexts.tersOfUse, 
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? AbColors.white : AbColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? AbColors.white : AbColors.primary,
              ),
            ),
          ]
         )
       )
      ],
    );
  }
}
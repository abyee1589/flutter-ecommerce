import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AbSocialButtons extends StatelessWidget {
  const AbSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final controller = Get.put(LoginController());
=======
    final Controller = Get.put(LoginController());
>>>>>>> 4d9ffbbc9c17fd6ba605274173703c24dcad8fd7
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: AbColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: AbSizes.iconMd,
              height: AbSizes.iconMd,
              image: AssetImage(AbImages.google)
            )
          )
        ),
        const SizedBox(width: AbSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: AbColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: AbSizes.iconMd,
              height: AbSizes.iconMd,
              image: AssetImage(AbImages.facebook)
            )
          )
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class AbSocialButtons extends StatelessWidget {
  const AbSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
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
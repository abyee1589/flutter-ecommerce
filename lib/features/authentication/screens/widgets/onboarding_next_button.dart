import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers.onboarding/onboarding_controllers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                  right: AbSizes.defaultSpace, 
                  bottom: AbDeviceUtils.getBottomNavigationBarHeight(),
                  child: ElevatedButton(
                    onPressed: (){OnBoardingController.instance.nextPage();}, 
                    style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Colors.black),
                    child: const Icon(Iconsax.arrow_right_3),
                    ),
                  );
  }
}
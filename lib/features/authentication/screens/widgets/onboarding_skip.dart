import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AbDeviceUtils.getAppBarHeight(), 
      right: AbSizes.defaultSpace, 
      child: TextButton(onPressed: (){ OnBoardingController.instance.skipPage();
  }, 
      child: const Text('Skip'))
    );
  }
}
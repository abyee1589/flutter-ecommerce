import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = AbHelperFunctions.isDarkMode(context);
    return Positioned(
            bottom: AbDeviceUtils.getBottomNavigationBarHeight() + 25,
            left: AbSizes.defaultSpace,
            child: SmoothPageIndicator(
              count: 3, 
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick, 
              effect: ExpandingDotsEffect(
                  activeDotColor: dark ? AbColors.light : AbColors.dark, 
                  dotHeight: 6)),
            
          );
  }
}
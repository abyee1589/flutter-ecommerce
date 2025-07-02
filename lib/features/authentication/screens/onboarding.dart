import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/controllers.onboarding/onboarding_controllers.dart';
import 'package:flutter_app/features/authentication/screens/widgets/onboarding_next_button.dart';
import 'package:get/get.dart';
import 'package:flutter_app/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:flutter_app/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'widgets/onboarding_page.dart';


class OnBoardingScreen extends StatelessWidget {
      OnBoardingScreen({super.key});

      final controller = Get.put(OnBoardingController());
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
              children: [
                /// Horizontally scrollable pages
                PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.updatePageIndicator,
                  children: const [
                    OnBoardingPage(
                      image: AbImages.onBoardingImage1, 
                      title: AbTexts.onBoardingTitle1, 
                      subTitle: AbTexts.onBoardingSubTitle1),
                    OnBoardingPage(
                      image: AbImages.onBoardingImage2, 
                      title: AbTexts.onBoardingTitle1, 
                      subTitle: AbTexts.onBoardingSubTitle1),
                    OnBoardingPage(
                      image: AbImages.onBoardingImage1, 
                      title: AbTexts.onBoardingTitle1, 
                      subTitle: AbTexts.onBoardingSubTitle1),
                    
                   ],
                ),
                const OnBoardingSkip(),                
                const OnBoardingDotNavigation(),
                const OnBoardingNextButton(),
                

                    /// Skip button

                    /// Dot navigation smoothPageIndicator

                    /// Circular button
                ]
            )
        );
    }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';



class OnBoardingScreen extends StatelessWidget {
    const OnBoardingScreen({super.key});
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: [
                    /// Horizontally scrollable pages
                    PageView(
                        children: [
                            Column(
                                children: [
                                   Image(
                                    width: AbHelperFunctions.screenWidth() * 0.8,
                                    height: AbHelperFunctions.screenHeight() * 0.6,
                                    image: AssetImage(AbImages.onBoardingImage1),
                                   ),
                                   Text(
                                    // AbTexts.obBoardingTitle1,
                                    'Yoo flutter dev',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                    textAlign: TextAlign.center
                                    ),
                                    const SizedBox(height: 10),
                                     Text(
                                    // AbTexts.obBoardingsubtitle1,
                                    'hello and welcome',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center
                                    ),
                                ],
                            ),
                        ],
                    ),

                    /// Skip button

                    /// Dot navigation smoothPageIndicator

                    /// Circular button

                ],
            ),
        );
    }
}
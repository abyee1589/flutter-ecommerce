import 'package:flutter/material.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.image, required this.title, required this.subTitle});

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                body: Stack(
                        children: [
                          Image(
                            width: AbHelperFunctions.screenWidth() * 0.8,
                            height: AbHelperFunctions.screenHeight() * 0.6,
                            image: AssetImage(image),
                          ),
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center
                          ),
                          const SizedBox(height: 10),
                          Text(
                            subTitle,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center
                          ),
                        ],
                ),
          );
      }
}
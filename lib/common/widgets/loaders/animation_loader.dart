import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class AbAnimationLoaderWidget extends StatelessWidget{

  const AbAnimationLoaderWidget({
    super.key, 
    required this.text, 
    required this.animation, 
    required this.showAction, 
    this.actionText,
    this.onActionPressed
  });

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.5),
          const SizedBox(height: AbSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AbSizes.defaultSpace),
          showAction 
          ? SizedBox(
            height: 250,
            child: OutlinedButton(
              onPressed: onActionPressed, 
              style: OutlinedButton.styleFrom(backgroundColor: AbColors.dark),
              child: Text(
                actionText!, 
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.black),
              )
            ),
          )
          : const SizedBox()
        ],
      ),
    );
  }
}


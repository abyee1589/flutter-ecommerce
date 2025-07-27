import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
// import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:lottie/lottie.dart';

class AbLoaders {
  // const AbLoaders({
  //   super.key, 
  //   required this.text, 
  //   required this.animation, 
  //   required this.showAction, 
  //   this.actionText,
  //   this.onActionPressed
  // });

  // final String text, animation;
  // final bool showAction;
  // final String? actionText;
  // final VoidCallback? onActionPressed;

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.5),
  //         const SizedBox(height: AbSizes.defaultSpace),
  //         Text(
  //           text,
  //           style: Theme.of(context).textTheme.bodyMedium,
  //           textAlign: TextAlign.center,
  //         ),
  //         const SizedBox(height: AbSizes.defaultSpace),
  //         showAction 
  //         ? SizedBox(
  //           height: 250,
  //           child: OutlinedButton(
  //             onPressed: onActionPressed, 
  //             style: OutlinedButton.styleFrom(backgroundColor: AbColors.dark),
  //             child: Text(
  //               actionText!, 
  //               style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.black),
  //             )
  //           ),
  //         )
  //         : const SizedBox()
  //       ],
  //     ),
  //   );
  // }
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AbHelperFunctions.isDarkMode(Get.context!)
              ? AbColors.darkerGrey.withOpacity(0.9) 
              : AbColors.grey.withOpacity(0.9),
          ),
          child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        )
      )
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AbColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: AbColors.white,)
    );
  }
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: AbColors.white,)
    );
  }
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.red.shade600,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: AbColors.white,)
    );
  }
}

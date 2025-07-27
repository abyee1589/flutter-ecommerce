import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class AbFullScreenLoader {
  static openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, 
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AbHelperFunctions.isDarkMode(Get.context!) ? AbColors.dark : AbColors.white,
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              SizedBox(height: 250),
              // AbLoaders(text: text, animation: animation, showAction: true,)
            ],
          ),
        )
      )
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }

  
}


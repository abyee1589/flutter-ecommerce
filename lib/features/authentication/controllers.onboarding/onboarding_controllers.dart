import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';

class OnBoardingController {
  static OnBoardingController get instance => Get.find();

  /// Variables 
  final pageController = PageController();
  Rx<int> currentInex = 0.obs;
  /// Update current index when page scroll
  void updatePageIndicator(index) => currentInex.value = index;


  /// Jump to the specific selected page 
  void dotNavigationClick(index) {
    currentInex.value = index;
    pageController.jumpTo(index);
  }


  /// Update current index and jump to next page
  void skipPage() {
    currentInex.value = 2;
    pageController.jumpToPage(2);
  }


  /// Update current indexand jump to the last page
  void nextPage() {
    if(currentInex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentInex.value + 1;
      pageController.jumpToPage (page);

    }
  }



}
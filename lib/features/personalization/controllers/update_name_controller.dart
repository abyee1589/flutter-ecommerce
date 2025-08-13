

import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/features/personalization/screens/profile/profile.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/http/network_manager.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
  try {
    AbFullScreenLoader.openLoadingDialog('We are updating your information', AbImages.lottieAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AbLoaders.warningSnackBar(
        title: 'Connection Failed',
        message: 'Please check your connection and try again!',
      );
      AbFullScreenLoader.stopLoading();
      return;
    }

    if (!updateUserNameFormKey.currentState!.validate()) {
      AbFullScreenLoader.stopLoading();
      return;
    }

    Map<String, dynamic> name = {
      'firstName': firstName.text.trim(),
      'lastName': lastName.text.trim()
    };

    await userRepository.updateSingleFIeld(name);

    // ✅ Option A: Update local observable manually
    userController.user.update((val) {
      if (val != null) {
        val.firstName = name['firstName']!;
        val.lastName = name['lastName']!;
      }
    });

    // ✅ Option B: Or re-fetch from Firebase
    // await userController.fetchUserRecord();

    AbFullScreenLoader.stopLoading();

    AbLoaders.successSnackBar(
      title: 'Congratulations!',
      message: 'Your name has been updated successfully!',
    );

    Get.off(() => const ProfileScreen());
  } catch (e) {
    AbFullScreenLoader.stopLoading();
    AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}

}
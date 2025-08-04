

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/features/authentication/screens/paswword_configuration/reset_password.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/http/network_manager.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  

  /// Send Forget Password link
  Future<void> sendPasswordResetEmail() async {
    try {
      AbFullScreenLoader.openLoadingDialog('Processing your request...', AbImages.lottieAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AbLoaders.warningSnackBar(title: 'No Internet!', message: 'PLease check your connection and try again!');
        AbFullScreenLoader.stopLoading();
        return;
      }
      
      /// Validate the form
      if(!forgetPasswordFormKey.currentState!.validate()){
        AbFullScreenLoader.stopLoading();
        return;
      }
      /// send the link to the email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      /// Remove the Loader
      AbFullScreenLoader.stopLoading();

      /// Show Success Screen
      AbLoaders.successSnackBar(title: 'Email Sent!', message: 'Email  link sent to reset your password!');

      /// Redirect Screen
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    }catch(e){
      AbFullScreenLoader.stopLoading();
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }

  }

  /// Resend the link
  Future<void> resendPasswordResetEmail(String email) async {
    try {
      AbFullScreenLoader.openLoadingDialog('Processing your request...', AbImages.lottieAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AbLoaders.warningSnackBar(title: 'No Internet!', message: 'PLease check your connection and try again!');
        AbFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Remove the Loader
      AbFullScreenLoader.stopLoading();

      /// Show Success Screen
      AbLoaders.successSnackBar(title: 'Email Sent!', message: 'Email  link sent to reset your password!');

    }catch(e){
      AbFullScreenLoader.stopLoading();
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
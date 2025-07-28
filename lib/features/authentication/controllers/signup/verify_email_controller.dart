

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send email whenever Verify Email Screen appears and set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRdirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      AbLoaders.successSnackBar(title: 'Verification Email Sent!', message: 'PLease check your inbox and verify your email!');
    } catch(e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Set Timer toautomatically redirect to the verify email screen 
  setTimerForAutoRdirect() {
    Timer.periodic(
      const Duration(seconds: 1), 
      (timer) async{
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if(user?.emailVerified ?? false){
          timer.cancel();
          Get.off(() => SuccessScreen(
            image: AbImages.deliveredEmailIllustration, 
            title: AbTexts.yourAccountCreatedTitle, 
            subTitle: AbTexts.yourAccountCreatedSubTitle, 
            onPressed: () => AuthenticationRepository.instance.screenRedirect()
          ));
        }
      }
    );
  }

  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser; 
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
        image: AbImages.deliveredEmailIllustration, 
        title: AbTexts.yourAccountCreatedTitle, 
        subTitle: AbTexts.yourAccountCreatedSubTitle, 
        onPressed: () => AuthenticationRepository.instance.screenRedirect()
      ));
    }
  }
}
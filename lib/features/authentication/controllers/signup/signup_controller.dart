import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/features/authentication/models/user_model.dart';
import 'package:flutter_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/http/network_manager.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
  try {
    if (!signupFormKey.currentState!.validate()) return;

    if (!privacyPolicy.value) {
      AbLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message: 'In order to create account, you must accept the Privacy Policy and Terms of Use'
      );
      return;
    }

    AbFullScreenLoader.openLoadingDialog('We are processing your information', AbImages.clothIcon);

    final iConnected = await NetworkManager.instance.isConnected();
    if (!iConnected) return;

    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );

    final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
    );

    final userRepository = UserRepository.instance;
    await userRepository.saveUserRecord(newUser);

    AbFullScreenLoader.stopLoading();

    AbLoaders.successSnackBar(
      title: 'Congratulations',
      message: 'Your account has been created successfully! Verify your email to continue',
    );

    Get.to(() => VerifyEmailScreen(email: email.text.trim()));
  } catch (e) {
    AbFullScreenLoader.stopLoading();
    AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}
}
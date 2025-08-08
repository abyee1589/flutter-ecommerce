import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/http/network_manager.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final Rx<bool> rememberMe = false.obs;
  final Rx<bool> hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  

  @override
  void onInit() {
    final storedEmail = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    final storedPassword = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';

    email.text = storedEmail;
    password.text = storedPassword;

    if (storedEmail.isNotEmpty && storedPassword.isNotEmpty) {
      rememberMe.value = true;
    }

    super.onInit();
}


  Future<void> emailAndPasswordSignIn() async{

   try {
     /// Open loading
    AbFullScreenLoader.openLoadingDialog('Logging you in...', AbImages.lottieAnimation);

    /// Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      AbFullScreenLoader.stopLoading();
      return;
    }

    /// Validate the form
    if(!loginFormKey.currentState!.validate()){
      AbFullScreenLoader.stopLoading();
      return;
    }

    /// Save data if remember me is selected
    if(rememberMe.value){
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }

    /// Login user using email and password
    final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    /// Fetch the user's detail
    await UserController.instance.fetchUserRecord();
     
    /// Remove loader
    AbFullScreenLoader.stopLoading();


    /// Screen Redirect 
    AuthenticationRepository.instance.screenRedirect();
   } catch(e) {
    AbFullScreenLoader.stopLoading();
    AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
  }

  
  Future<void> googleSignIn() async{

   try {
     /// Open loading
    AbFullScreenLoader.openLoadingDialog('Logging you in...', AbImages.lottieAnimation);

    /// Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AbFullScreenLoader.stopLoading();
      AbLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your connection and try again.');
      return;
    }


    /// Login user using email and password
    final userCredential = await AuthenticationRepository.instance.loginInWithGoogle();
     
    /// Remove loader
    AbFullScreenLoader.stopLoading();

    /// Screen Redirect 
    AuthenticationRepository.instance.screenRedirect();
   } catch (e, stackTrace) {
  AbFullScreenLoader.stopLoading();
  AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  debugPrintStack(stackTrace: stackTrace);
}

  }
}
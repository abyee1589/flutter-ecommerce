import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/features/authentication/screens/onboarding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen 
  screenRedirect() async {
    if(kDebugMode){
      print('========== Get Storage Auth Repo =============');
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
      ? Get.offAll(() => const LoginScreen()) 
      : Get.offAll(() => OnBoardingScreen());
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw AbFirebaseAuthException(e.code);
  } on FirebaseException catch (e) {
    throw AbFirebaseException(e.code);
  } on FormatException catch (_) {
    throw AbFormatException();
  } on PlatformException catch (e) {
    throw AbPlatformException(e.code);
  } catch (e) {
    throw Exception('Something went wrong. Please try again.');
  }
}


}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/features/authentication/screens/onboarding.dart';
import 'package:flutter_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_app/navigation_menu.dart';
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
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }
      else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
        deviceStorage.writeIfNull('isFirstTime', true);
        deviceStorage.read('isFirstTime') != true
         ? Get.offAll(() => const LoginScreen()) 
         : Get.offAll(() => OnBoardingScreen());
    }
   
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
    await _auth.signOut(); // ✅ Ensure no previous user is active
    final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
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

/// Email Verification 
Future<void> sendEmailVerification() async {
  try {
    final user = _auth.currentUser;
    await user?.reload(); // Reload the user from Firebase
    final refreshedUser = _auth.currentUser;

    if (refreshedUser != null && !refreshedUser.emailVerified) {
      await refreshedUser.sendEmailVerification();
    } else if (user == null) {
      throw 'No user is currently signed in.';
    } else if (user.emailVerified) {
      throw 'Email is already verified.';
    }
  } on FirebaseAuthException catch (e) {
    throw AbFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw AbFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw AbFormatException();
  } on PlatformException catch (e) {
    throw AbPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong! Please try again.';
  }
}

 /// Logout the User 
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }on FirebaseAuthException catch(e) {
      throw AbFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
       throw AbFirebaseException(e.code).message;
    } on FormatException catch(_) {
       throw AbFormatException();
    } on PlatformException catch(e) {
       throw AbPlatformException(e.code).message;
    } catch(e) {
       throw 'Nothing went wrong!, Please try again!';
    }
  }
}
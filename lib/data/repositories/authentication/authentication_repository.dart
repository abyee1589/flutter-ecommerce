import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/features/authentication/screens/onboarding.dart';
import 'package:flutter_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter_app/navigation_menu.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  /// called from main.dart on app launch
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    // screenRedirect();
  }

  /// Function to Show Relevant Screen 
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user!= null){
      if(!user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }
      else {
        Get.offAll(() => const SignupScreen());
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
    // await _auth.signOut(); // ✅ Ensure no previous user is active
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
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
  try {
    final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
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


/// ============== Federated Identity =============
/// Signin with Google
Future<UserCredential> loginInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch(e) {
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

/// Email Verification 
Future<void> sendEmailVerification() async {
  try {
    await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    throw AbFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw AbFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw AbFormatException();
  } on PlatformException catch (e) {
    throw AbPlatformException(e.code).message;
  } catch (e) {
    throw('Something went wrong! $e');
  }
}


/// Forget PAssword
Future<void> sendPasswordResetEmail(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    throw AbFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw AbFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw AbFormatException();
  } on PlatformException catch (e) {
    throw AbPlatformException(e.code).message;
  } catch (e) {
    throw('Something went wrong! $e');
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
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

  /// called from main.dart on app launch
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    // screenRedirect();
  }

  /// Function to Show Relevant Screen 
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
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


  /// Federated identity and social sign in
  /// Email Verification 
Future<UserCredential?> signInWithGoogle() async {
  try {
    // 1. Await the Google Sign-In process itself
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final GoogleSignInAccount? userAccount = await GoogleSignIn.instance.authenticate();

    // Handle user cancellation gracefully
    if (userAccount == null) {
      return null;
    }

    // 2. CRITICAL: Await the authentication details from the userAccount.
    // Without this 'await', 'googleAuth' will be a Future<GoogleSignInAuthentication>
    // instead of the actual GoogleSignInAuthentication object.
    // ignore: await_only_futures
    final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

    /// Create Credentials for Firebase
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,       // These getters now exist because googleAuth
      accessToken: googleAuth.accessToken, // is the correct type!
    );

    /// Once the user signed in, return the credential via Firebase Authentication
    // Assuming _auth is an instance of FirebaseAuth (e.g., FirebaseAuth.instance)

    // final GoogleSignInAccount? userAccount = GoogleSignIn().signIn();
    // final GoogleSignInAuthentication googleAuth = await userAccount?.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   idToken: googleAuth.idToken,       // These getters now exist because googleAuth
    //   accessToken: googleAuth.accessToken, // is the correct type!
    // );

    return await _auth.signInWithCredential(credential);

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


}

// extension on GoogleSignIn {
//   GoogleSignInAccount? signIn() {}
// }

extension on GoogleSignInAuthentication {
  get accessToken => null;
}
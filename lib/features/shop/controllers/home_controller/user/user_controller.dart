

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/authentication/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = UserRepository.instance;
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try{
      if(userCredential != null){
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');
        
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join() : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        /// Save user data 
        await userRepository.saveUserRecord(user);
      }
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


   /// Fetch user record
  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
  
        /// Save user data 
        await userRepository.saveUserRecord(user);
      } catch(e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }
}
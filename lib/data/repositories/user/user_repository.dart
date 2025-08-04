
import 'package:flutter/services.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/features/authentication/models/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance; 

  /// Function to save user data to the Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
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

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try{
      final documentSnapShot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapShot.exists){
        return UserModel.fromSnapshot(documentSnapShot);
      }
      else{
        return UserModel.empty();
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

  /// Function to update user data
  Future<void> updateUserDetails(UserModel userToUpdate) async {
    try{
      await _db.collection('Users').doc(userToUpdate.id).update(userToUpdate.toJson()); 
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

  /// Function to update user single field 
  Future<void> updateSingleFIeld(Map<String, dynamic> json) async {
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json); 
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
  
  /// Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try{
      await _db.collection('Users').doc(userId).delete(); 
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

import 'package:flutter/services.dart';
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
}
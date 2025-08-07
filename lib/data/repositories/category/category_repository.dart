import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list =  snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch(e) {
      throw AbFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw AbFormatException();
    } on PlatformException catch(e) {
      throw AbPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong: ${e.toString()}';
    }
  }
}
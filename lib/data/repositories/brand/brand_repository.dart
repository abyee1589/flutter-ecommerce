import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await db.collection('Brands').get();
      final result = snapshot.docs
          .map((brand) => BrandModel.fromSnapshot(brand))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code);
    } on FormatException {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong: while fetching brands');
    }
  }
}

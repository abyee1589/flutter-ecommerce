

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables 
  final _db = FirebaseFirestore.instance;

   Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
   
    } on FirebaseException catch(e) {
       throw AbFirebaseException(e.code).message;
    } on FormatException catch(_) {
       throw AbFormatException();
    } on PlatformException catch(e) {
       throw AbPlatformException(e.code).message;
    } catch(e) {
       throw 'Something went wrong while fetching banners!';
    }
  }
}
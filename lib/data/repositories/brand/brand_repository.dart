import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/utils/local_storage/cloudinary.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

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
      throw Exception(
        'Something went wrong: while fetching brands: ${e.toString()}',
      );
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final QuerySnapshot brandCategoryQuery = await db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      final List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      if (brandIds.isEmpty) return [];
      final brandsQuery = await db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      final List<BrandModel> brands = brandsQuery.docs
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();
      return brands;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code);
    } on FormatException {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code);
    } catch (e) {
      print(e.toString());
      throw Exception('Something went wrong: while fetching brands');
    }
  }

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final cloudinary = CloudinaryUpload();

      for (var brand in brands) {
        // 1. Load image from assets
        final byteData = await rootBundle.load(brand.image);
        final fileName = path.basename(brand.image);

        String? url;

        if (kIsWeb) {
          // Web: Directly upload from bytes (no temp dir)
          final fileBytes = byteData.buffer.asUint8List();
          url = await cloudinary.uploadFile(
            XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
            folderType: 'Brands',
          );
        } else {
          // Mobile/Desktop: Use temp directory
          final tempDir = await getTemporaryDirectory();
          final tempFile = File('${tempDir.path}/$fileName');
          await tempFile.writeAsBytes(byteData.buffer.asUint8List());
          url = await cloudinary.uploadFile(
            XFile(tempFile.path),
            folderType: 'Brands',
          );
        }

        // Replace asset path with Cloudinary URL
        brand.image = url ?? '';

        // Upload to Firestore
        await db.collection('Brands').doc(brand.id).set(brand.toJson());
      }
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code);
    } on FormatException {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }
}

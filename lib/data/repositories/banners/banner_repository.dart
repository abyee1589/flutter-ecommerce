

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/banner_model.dart';
import 'package:flutter_app/utils/local_storage/cloudinary.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

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
   Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final cloudinary = CloudinaryUpload();

      for (var banner in banners) {
        // 1. Load image from assets
        final byteData = await rootBundle.load(banner.image); 
        final fileName = path.basename(banner.image);

        String? url;

        if (kIsWeb) {
          // Web: Directly upload from bytes (no temp dir)
          final fileBytes = byteData.buffer.asUint8List();
          url = await cloudinary.uploadFile(
            XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
            folderType:'Banners'
          );
        } else {
          // Mobile/Desktop: Use temp directory
          final tempDir = await getTemporaryDirectory();
          final tempFile = File('${tempDir.path}/$fileName');
          await tempFile.writeAsBytes(byteData.buffer.asUint8List());
          url = await cloudinary.uploadFile(XFile(tempFile.path), folderType:'Banners');
        }

        if (url == null) {
          throw Exception('Failed to upload banner image');
        }

        // Replace asset path with Cloudinary URL
        banner.image = url;

        // Upload to Firestore
        await _db.collection('Banners').doc(banner.id).set(banner.toJson());
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
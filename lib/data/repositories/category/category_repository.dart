import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/utils/local_storage/cloudinary.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((doc) => CategoryModel.fromSnapshot(doc))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      // Throw the exception object, not just the message string, for better error handling.
      throw AbFirebaseException(e.code);
    } on FormatException catch (_) {
      throw AbFormatException();
    } on PlatformException catch (e) {
      // Throw the exception object, not just the message string, for better error handling.
      throw AbPlatformException(e.code);
    } catch (e) {
      // FIX: Throw a proper Exception object instead of a string to prevent a crash.
      throw Exception('Something went wrong: ${e.toString()}');
    }
  }

  /// Upload categories to cloudinary
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final cloudinary = CloudinaryUpload();

      for (var category in categories) {
        // 1. Load image from assets
        final byteData = await rootBundle.load(category.image);
        final fileName = path.basename(category.image);

        String? url;

        if (kIsWeb) {
          // Web: Directly upload from bytes (no temp dir)
          final fileBytes = byteData.buffer.asUint8List();
          url = await cloudinary.uploadFile(
            XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
            folderType: 'Categories',
          );
        } else {
          // Mobile/Desktop: Use temp directory
          final tempDir = await getTemporaryDirectory();
          final tempFile = File('${tempDir.path}/$fileName');
          await tempFile.writeAsBytes(byteData.buffer.asUint8List());
          url = await cloudinary.uploadFile(
            XFile(tempFile.path),
            folderType: 'Categories',
          );
        }

        // Replace asset path with Cloudinary URL
        category.image = url ?? '';

        // Upload to Firestore
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
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

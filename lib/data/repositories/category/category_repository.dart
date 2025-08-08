import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/utils/local_storage/cloudinar.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list =  snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
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
  // Future<String> uploadImageData(String path, Uint8List image, String name) async {
  //   try {
  //     final tempDir = await getTemporaryDirectory();
  //     final file = File('${tempDir.path}/$name');
  //     await file.writeAsBytes(image);
  //     return await uploadImageFile(file);
  //   } on FirebaseException catch(e) {
  //     throw AbFirebaseException(e.code).message;
  //   } on FormatException catch(_) {
  //     throw AbFormatException();
  //   } on PlatformException catch(e) {
  //     throw AbPlatformException(e.code).message;
  //   } catch(e) {
  //     throw 'Something went wrong: ${e.toString()}';
  //   }
  // }
//   Future<String> uploadImageData(String path, Uint8List image, String name) async {
//   try {
//     final ref = FirebaseStorage.instance.ref(path).child(name);
//     final uploadTask = await ref.putData(image);
//     final url = await uploadTask.ref.getDownloadURL();
//     return url;
//   } on FirebaseException catch (e) {
//     throw AbFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw AbFormatException();
//   } on PlatformException catch (e) {
//     throw AbPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Something went wrong: ${e.toString()}';
//   }
// }


  
//   /// Uploads a file (e.g., from gallery or camera)
//   Future<String> uploadImageFile(File file) async {
//     try {
//       final response = await cloudinary.uploadFile(
//         CloudinaryFile.fromFile(file.path),
//       );
//       return response.secureUrl;
//     } catch (e) {
//       throw 'Image upload (file) failed: $e';
//     }
//   }
// }

  /// Upload categories to cloudinary
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
  try {
    final cloudinary = CloudinaryUpload();

    for (var category in categories) {
      // 1. Load image from assets
      final byteData = await rootBundle.load(category.image); // e.g. 'assets/images/abc.png'

      // 2. Get temp directory and create a temp file
      final tempDir = await getTemporaryDirectory();
      final fileName = path.basename(category.image); // get only the file name from path
      final tempFile = File('${tempDir.path}/$fileName');

      // 3. Write bytes to the file
      await tempFile.writeAsBytes(byteData.buffer.asUint8List());

      // 4. Upload to Cloudinary using your uploader
      final url = await cloudinary.uploadFile(XFile(tempFile.path));

      if (url == null) {
        throw 'Failed to upload image for category ${category.name}';
      }

      // 5. Replace asset path with Cloudinary URL
      category.image = url;

      // 6. Upload to Firestore
      await _db.collection('Categories').doc(category.id).set(category.toJson());
    }
  } on FirebaseException catch (e) {
    throw AbFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw AbFormatException();
  } on PlatformException catch (e) {
    throw AbPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong: ${e.toString()}';
  }
}
}

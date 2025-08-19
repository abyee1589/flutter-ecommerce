import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle, PlatformException;
import 'package:flutter_app/exceptions/user_exceptions.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/local_storage/cloudinary.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';


class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      final list = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
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

  Future<void> uploadDummyProducts(List<ProductModel> products) async {
    try {
      final cloudinary = CloudinaryUpload();

      for (var product in products) {
        print('started uploading the tubnails');
        // 1️⃣ Upload thumbnail
        {
          final byteData = await rootBundle.load(product.thubnail);
          final fileName = path.basename(product.thubnail);
          String? url;

          if (kIsWeb) {
            final fileBytes = byteData.buffer.asUint8List();
            url = await cloudinary.uploadFile(
              XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
              folderType: 'Products/Thubnails',
            );
          } else {
            final tempDir = await getTemporaryDirectory();
            final tempFile = File('${tempDir.path}/$fileName');
            await tempFile.writeAsBytes(byteData.buffer.asUint8List());
            url = await cloudinary.uploadFile(XFile(tempFile.path), folderType: 'Products/Thubnails');
          }

          if (url == null) throw Exception('Failed to upload thumbnail for ${product.title}');
          product.thubnail = url;
        }
         print("🚀 Starting upload for product: ${product.title} (${product.id})");
        // 1️⃣ Upload brand
         if (product.brand != null && product.brand!.image.isNotEmpty){
          final byteData = await rootBundle.load(product.brand!.image);
          final fileName = path.basename(product.brand!.image);
          String? url;

          if (kIsWeb) {
            final fileBytes = byteData.buffer.asUint8List();
            url = await cloudinary.uploadFile(
              XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
              folderType: 'Products/brands',
            );
          } else {
            final tempDir = await getTemporaryDirectory();
            final tempFile = File('${tempDir.path}/$fileName');
            await tempFile.writeAsBytes(byteData.buffer.asUint8List());
            url = await cloudinary.uploadFile(XFile(tempFile.path), folderType: 'Products/brands');
          }

          if (url == null) throw Exception('Failed to upload brand for ${product.title}');
          product.brand!.image = url;
        }
         print("🚀 Starting upload for product: ${product.title} (${product.id})");
        // 2️⃣ Upload product images
        for (int i = 0; i < product.images!.length; i++) {
          final byteData = await rootBundle.load(product.images![i]);
          final fileName = path.basename(product.images![i]);
          String? url;

          if (kIsWeb) {
            final fileBytes = byteData.buffer.asUint8List();
            url = await cloudinary.uploadFile(
              XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
              folderType: 'Products',
            );
          } else {
            final tempDir = await getTemporaryDirectory();
            final tempFile = File('${tempDir.path}/$fileName');
            await tempFile.writeAsBytes(byteData.buffer.asUint8List());
            url = await cloudinary.uploadFile(XFile(tempFile.path), folderType: 'Products');
          }

          if (url == null) throw Exception('Failed to upload image ${product.images![i]} for ${product.title}');
          product.images![i] = url;
        }
         print("✅ Brand uploaded for ${product.id}");

        // 3️⃣ Upload variation images
        // if(product.productType == productType.variable.toString()){}
        for (var variation in product.productVariations!) {
          final byteData = await rootBundle.load(variation.image);
          final fileName = path.basename(variation.image);
          String? url;

          if (kIsWeb) {
            final fileBytes = byteData.buffer.asUint8List();
            url = await cloudinary.uploadFile(
              XFile.fromData(fileBytes, name: fileName, mimeType: 'image/png'),
              folderType: 'Products',
            );
          } else {
            final tempDir = await getTemporaryDirectory();
            final tempFile = File('${tempDir.path}/$fileName');
            await tempFile.writeAsBytes(byteData.buffer.asUint8List());
            url = await cloudinary.uploadFile(XFile(tempFile.path), folderType: 'Products');
          }

          if (url == null) throw Exception('Failed to upload variation image ${variation.image} for ${product.title}');
          variation.image = url;
        }
        print("✅ Images uploaded for ${product.id}");

        // 4️⃣ Upload product to Firestore
        try {
          await _db.collection('Products').doc(product.id).set(product.toJson());
          print("📦 Firestore saved product: ${product.title} (${product.id})");
        } catch (e, st) {
          print("❌ Failed to save ${product.title}: $e");
          print(st);
        }
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
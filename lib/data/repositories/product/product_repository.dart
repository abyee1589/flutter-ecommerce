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

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      final list = snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      //  print(snapshot.docs.map((e) => e.data()).toList());
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
      throw Exception(
        'Something went wrong while fetching products: ${e.toString()}',
      );
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      //  print(snapshot.docs.map((e) => e.data()).toList());
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
      throw Exception(
        'Something went wrong while fetching products: ${e.toString()}',
      );
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final typedQuery = query as Query<Map<String, dynamic>>;
      final querySnapshot = await typedQuery.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
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
      throw Exception(
        'Something went wrong while fetching products: ${e.toString()}',
      );
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      final List<ProductModel> favouriteProducts = snapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return favouriteProducts;
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
      throw Exception(
        'Something went wrong while fetching products: ${e.toString()}',
      );
    }
  }

  Future<List<ProductModel>> getProductsForBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
                .collection('Products')
                .where('Brand.Id', isEqualTo: brandId)
                .get()
          : await _db
                .collection('Products')
                .where('Brand.Id', isEqualTo: brandId)
                .limit(limit)
                .get();
      final productList = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return productList;
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
      throw Exception(
        'Something went wrong while fetching products: ${e.toString()}',
      );
    }
  }

  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
    int limit = -1,
  }) async {
    try {
      final QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
                .collection('ProductCategory')
                .where('categoryId', isEqualTo: categoryId)
                .get()
          : await _db
                .collection('ProductCategory')
                .where('categoryId', isEqualTo: categoryId)
                .limit(limit)
                .get();
      final productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();
      if (productIds.isEmpty) return [];
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      final productList = productsQuery.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();
      print('Here is the product list $productList');
      return productList;
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
      throw Exception(
        'Something went wrong while fetching products: ${e.toString()}',
      );
    }
  }

  Future<void> uploadDummyProducts(List<ProductModel> products) async {
    try {
      final cloudinary = CloudinaryUpload();

      for (var product in products) {
        print('started uploading the tubnails');
        // 1️⃣ Upload thumbnail
        {
          final byteData = await rootBundle.load(product.thumbnail);
          final fileName = path.basename(product.thumbnail);
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
            url = await cloudinary.uploadFile(
              XFile(tempFile.path),
              folderType: 'Products/Thubnails',
            );
          }
          product.thumbnail = url ?? '';
        }
        print(
          "🚀 Starting upload for product: ${product.title} (${product.id})",
        );
        // 1️⃣ Upload brand
        if (product.brand != null && product.brand!.image.isNotEmpty) {
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
            url = await cloudinary.uploadFile(
              XFile(tempFile.path),
              folderType: 'Products/brands',
            );
          }
          product.brand!.image = url ?? '';
        }
        print(
          "🚀 Starting upload for product: ${product.title} (${product.id})",
        );
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
            url = await cloudinary.uploadFile(
              XFile(tempFile.path),
              folderType: 'Products',
            );
          }
          product.images![i] = url ?? '';
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
            url = await cloudinary.uploadFile(
              XFile(tempFile.path),
              folderType: 'Products',
            );
          }
          variation.image = url ?? '';
        }
        print("✅ Images uploaded for ${product.id}");

        // 4️⃣ Upload product to Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
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

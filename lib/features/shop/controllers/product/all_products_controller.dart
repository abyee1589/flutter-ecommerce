import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data/repositories/product/product_repository.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final productsRepository = ProductRepository.instance;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await productsRepository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}

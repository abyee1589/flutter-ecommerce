

import 'package:flutter_app/data/dummy_data.dart';
import 'package:flutter_app/data/repositories/product/product_repository.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  /// Variables
  final _productRepository = Get.put(ProductRepository());
  RxBool isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

   Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final fetchedProducts = await _productRepository.getFeaturedProducts();
      featuredProducts.assignAll(fetchedProducts);
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void uploadAllProducts() async {
    try{
      isLoading.value = true;
      await _productRepository.uploadDummyProducts(AbDummyData.products);

      AbLoaders.successSnackBar(
        title: 'Success',
        message: 'All dummy products uploaded successfully!',
      );

      // Refresh list after upload
      fetchFeaturedProducts(); 

    }catch(e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}


import 'package:flutter_app/data/dummy_data.dart';
import 'package:flutter_app/data/repositories/product/product_repository.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/enums.dart';
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

  Future<void> uploadAllProducts() async {
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

  String getProductPrice(ProductModel product) {
    // Case 1: Simple product
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } 
    
    // Case 2: Product with variations
    else {
      double smallestPrice = double.infinity;
      double largestPrice = 0.0;

      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice == largestPrice) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  } 

  String getProductStockStatus(int stock) {
    return(stock > 0 ? 'In Stock' : 'Out of Stock');
  }

}
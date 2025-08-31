import 'package:flutter_app/data/dummy_data.dart';
import 'package:flutter_app/data/repositories/brand/brand_repository.dart';
import 'package:flutter_app/data/repositories/product/product_repository.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final RxBool isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getAllBrands();
    super.onInit();
  }

  Future<void> getAllBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).take(4),
      );
      isLoading.value = false;
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> uploadBrands() async {
    try {
      final brandsToUpload = AbDummyData.brands;
      // Fetch categories from the repository
      await brandRepository.uploadDummyData(brandsToUpload);
      AbLoaders.successSnackBar(
        title: 'Success!',
        message: 'Your brands data is uploaded successfully!',
      );
      getAllBrands();
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(
        brandId: brandId, limit: limit
      );
      return products;
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await BrandRepository.instance.getBrandsForCategory(
        categoryId,
      );
      return brands;
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}

import 'package:flutter_app/data/dummy_data.dart';
import 'package:flutter_app/data/repositories/category/category_repository.dart';
import 'package:flutter_app/data/repositories/product/product_repository.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/utils/popups/loaders.dart';

/// Controller to manage categories state and fetching
class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  // Use an RxList to automatically update the UI when the list changes
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Function to fetch categories from the database
  Future<void> fetchCategories() async {
    try {
      // Show loading spinner
      isLoading.value = true;

      // Fetch categories from the repository
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);
      featuredCategories.assignAll(categories.where((category) => category.isFeatured && category.parentId.isEmpty));
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // This is another critical fix. The loader must be closed, whether or not there was an error.
      // This prevents the "Unexpected null value" error from the loader.
      isLoading.value = false;
    }
  }

  Future<void> uploadCategory() async {
    try {
      final catagoriesToUpload = AbDummyData.categories;
      // Fetch categories from the repository
      await _categoryRepository.uploadDummyData(catagoriesToUpload);
      AbLoaders.successSnackBar(title: 'Success!', message: 'Your category data is uploaded successfully!');
      fetchCategories();
    } catch (e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async{
    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
    } catch(e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<Map<CategoryModel, List<ProductModel>>> getSubcategoriesWithProducts(String categoryId) async {
  final subCategories = await CategoryRepository.instance.getSubCategorries(categoryId);
  
  final Map<CategoryModel, List<ProductModel>> result = {};
  for (final sub in subCategories) {
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: sub.id);
    result[sub] = products;
  }
  return result;
}
}

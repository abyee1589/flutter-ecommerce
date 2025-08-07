

import 'package:flutter_app/data/repositories/category/category_repository.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final categoryRepository = CategoryRepository.instance;
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load Category data
  Future<void> fetchCategories() async {
    try {
      /// Show leader while loading categories
      isLoading.value = true;

      /// Fetch categories from data source Firestore
      final categories = await CategoryRepository.instance.getAllCategories();

      /// Update category list 
      allCategories.assignAll(categories);

      /// Fiter Featured Categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch(e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
      AbFullScreenLoader.stopLoading();
    }
  }

}
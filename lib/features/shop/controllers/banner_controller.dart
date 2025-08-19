

import 'package:flutter_app/data/dummy_data.dart';
import 'package:flutter_app/data/repositories/banner/banner_repository.dart';
import 'package:flutter_app/features/shop/models/banner_model.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();
  
  /// Variables
  final RxBool isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final _bannerRepository = Get.put(BannerRepository());
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  void updatePageIndicater(index) {
    carousalCurrentIndex.value = index;
  }

  @override
  void onInit(){
    fetchBanners();
    super.onInit();
  }

   /// Function to fetch categories from the database
  Future<void> fetchBanners() async {
    try {
      // Show loading spinner
      isLoading.value = true;
      final banners =  await _bannerRepository.fetchBanners();
      this.banners.assignAll(banners);
      
    } catch (e) {
        AbLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: e.toString(),
        );
    } finally {
      // This is another critical fix. The loader must be closed, whether or not there was an error.
      // This prevents the "Unexpected null value" error from the loader.
      isLoading.value = false;
    }
  }
  Future<void> uploadBanners() async{
    try {
      final bannersToUpload = AbDummyData.banners;
      // Fetch categories from the repository
      await _bannerRepository.uploadDummyData(bannersToUpload);
      AbLoaders.successSnackBar(title: 'Success!', message: 'Your banner data is uploaded successfully!');
      fetchBanners();
      
    } catch (e) {
        AbLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: e.toString(),
        );
    }
  }
}
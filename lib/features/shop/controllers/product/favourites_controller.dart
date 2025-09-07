
import 'dart:convert';

import 'package:flutter_app/data/repositories/product/product_repository.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/local_storage/storage_utitlity.dart';
import 'package:flutter_app/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override 
  void onInit() {
    super.onInit();
    initFavourites();
  }
  
  void initFavourites() {
    final json = AbLocalStorage.instance().readData('favourites');
    if(json != null){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }
  
  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if(!favourites.containsKey(productId)){
      favourites[productId] = true;

      saveFavouritesToStorage();
      AbLoaders.customToast(message: 'Product added to wishlit successfully!');
    }
    else {
      AbLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      AbLoaders.customToast(message: 'Product removed from wishlit successfully!');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    AbLocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
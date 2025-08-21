
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController{
  static ImagesController get instance => Get.find();

  final RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {

    /// Use Set to add unique images only
    Set<String> images = {};

    /// load thumbnail image
    images.add(product.thumbnail);
  
    /// Set thumbnail as selected image
    selectedProductImage.value = product.thumbnail;
    
    /// Get all images the product model if not null 
    if(product.images != null) {
      images.addAll(product.images!);
    }

    /// Get all images from the product variations if not null 
    if(product.productVariations != null && product.productVariations!.isEmpty){
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }
  

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(vertical: AbSizes.defaultSpace * 2, horizontal: AbSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: AbSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
              ),
            )
          ],
        ),
      )
    );
  }
}
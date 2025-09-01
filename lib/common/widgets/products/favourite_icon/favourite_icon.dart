import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/features/shop/controllers/product/favourites_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbFavouriteIcon extends StatelessWidget {
  const AbFavouriteIcon({
    super.key, required this.productId,
  });
  final String productId;
   
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => AbCircularIcon(
        icon: (controller.favourites[productId] ?? false) ? Iconsax.heart5 : Iconsax.heart, 
        color: (controller.favourites[productId] ?? false) ? AbColors.error : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
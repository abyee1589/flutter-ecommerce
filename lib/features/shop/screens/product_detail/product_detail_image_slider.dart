import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/features/shop/controllers/product/images_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbProductImageSlider extends StatelessWidget {
  const AbProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return AbCurvedEdgeWidget(
      child: Container(
        color: dark ? AbColors.darkGrey : AbColors.light,
        child: Stack(
          children: [

            /// main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(AbSizes.productImageRadius * 2),
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image, 
                      progressIndicatorBuilder: (_, __, downloadProgress) => 
                        CircularProgressIndicator(value: downloadProgress.progress, color: AbColors.primary,),
                    ),
                  );
                }),
              ),
            ),
    
            /// Image slider
            Positioned(
              right: 0,
              bottom: 10,
              left: AbSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated( 
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  separatorBuilder: (_, _) => const SizedBox(width: AbSizes.spaceBtwItems), 
                  itemBuilder: (_, index) => Obx(() {
                    final selectedImage = controller.selectedProductImage.value == images[index];
                    return AbRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor: dark ? AbColors.black : AbColors.white,
                      border: Border.all(color: selectedImage ? AbColors.primary : Colors.transparent),
                      padding: const EdgeInsets.all(AbSizes.sm),
                      imageUrl: images[index],
                      onPressed: () => controller.selectedProductImage.value = images[index],
                    );
                  })
                ),
              ),
            ),
    
            /// Appbar icons
            const AbAppBar(
              showBackArrow: true,
              actions: [
                AbCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

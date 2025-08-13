import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/banner_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';
import 'package:get/get.dart';

class AbPromoSlider extends StatelessWidget {
  const AbPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if(controller.isLoading.value) return const AbShimmerEffect(width: double.infinity, height: 190);
      if(controller.banners.isEmpty) return const Center(child: Text('No Data Found'));
      return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicater(index)),
          items: controller.banners.map((banner) => AbRoundedImage(imageUrl: AbImages.clothIcon, isNetworkImage: true, onPressed: () => Get.toNamed(banner.targetScreen),)).toList(),
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < controller.banners.length; i++) AbCircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carousalCurrentIndex.value == i ? AbColors.primary : AbColors.grey)
            ],),
          ),
        )
      ],
    );
  });
  }
}
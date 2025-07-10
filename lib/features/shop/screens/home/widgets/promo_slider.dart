import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/home_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AbPromoSlider extends StatelessWidget {
  const AbPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicater(index)),
          items: banners.map((url) => AbRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i++) CircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carouselCurrentIndex.value == i ? AbColors.primary : AbColors.grey)
            ],),
          ),
        )
      ],
    );
  }
}

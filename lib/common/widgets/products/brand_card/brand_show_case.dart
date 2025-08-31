import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:flutter_app/utils/shimmers/shimmer_loader.dart';
import 'package:get/get.dart';

class AbBrandshowcase extends StatelessWidget {
  const AbBrandshowcase({super.key, required this.images, required this.brand});

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: AbRoundedContainer(
        showBorder: false,
        borderColor: AbColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(right: AbSizes.spaceBtwItems),
        padding: const EdgeInsets.all(AbSizes.md),
        child: Column(
          children: [
            BrandCard(brand: brand),
            const SizedBox(height: AbSizes.spaceBtwItems),
            Row(
              children: images
                  .map((image) => brandToProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandToProductImageWidget(String image, context) {
  return AbRoundedContainer(
    height: 100,
    backgroundColor: AbHelperFunctions.isDarkMode(context)
        ? AbColors.darkGrey
        : AbColors.white,
    margin: const EdgeInsets.only(right: AbSizes.sm),
    padding: const EdgeInsets.all(AbSizes.md),
    child: CachedNetworkImage(
      fit: BoxFit.contain,
      progressIndicatorBuilder: (context, url, dowloadProgress) => const AbShimmerEffect(width: 100, height: 100),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageUrl: image
      )
  );
}

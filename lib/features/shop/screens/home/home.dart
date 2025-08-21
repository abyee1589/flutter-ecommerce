import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_app/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return SingleChildScrollView(
      child: Column(
        children: [
          const AbPrimaryHeaderContainer(
            child: Column(
              children: [
                /// Appbar
                AbHomeAppBar(),
                SizedBox(height: AbSizes.spaceBtwSections),

                /// Searchbar
                AbSearchContainer(text: 'Search in Store', icon: Iconsax.search_normal),
                SizedBox(height: AbSizes.spaceBtwSections),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: AbSizes.defaultSpace),
                  child: Column(
                    children: [
                      AbSectionHeading(title: 'Popular categories', showActionButton: false, textColor: AbColors.white),
                      SizedBox(height: AbSizes.spaceBtwItems),
                      HomeCategories(),
                      SizedBox(height: AbSizes.spaceBtwSections,)
                    ],
                  ),
                )
              ],
            ),
          ),

          /// Body
          Padding(
            padding: const EdgeInsets.all(AbSizes.defaultSpace),
            child: Column(
              children: [
                const AbPromoSlider(),
                const SizedBox(height: AbSizes.spaceBtwSections),
                AbSectionHeading(title: 'Popular products',showActionButton: true , onPressed: () => Get.to(() => const AllProducts())),
                Obx(() {
                  if(controller.isLoading.value) return const AbShimmerEffect(width: 70, height: 55);
                  if(controller.featuredProducts.isEmpty) return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium));
                  return AbGridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_, index) =>  AbProductCardVertical(product: controller.featuredProducts[index]));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

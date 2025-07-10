import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/screens/home/widgets/homee_categories.dart';
import 'package:flutter_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const AbPromoSlider(banners: [AbImages.clothIcon, AbImages.promoBanner1]),
                const SizedBox(height: AbSizes.spaceBtwSections),
                AbSectionHeading(title: 'Popular products', onPressed: () {}),
                AbGridLayout(itemCount: 4, itemBuilder: (_, index) => const AbProductCardVertical()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

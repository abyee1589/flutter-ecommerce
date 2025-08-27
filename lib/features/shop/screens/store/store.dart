import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/appbar/tabbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/products/cart/cart_icon_menu.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/features/shop/screens/brand/all_brands.dart';
import 'package:flutter_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:flutter_app/utils/shimmers/brands_shimmer.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = AbSizes.borderRadiusLg,
    this.showBorder = false,
    this.padding,
    this.margin,
    this.backgroundColor = AbColors.white,
    this.borderColor = AbColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AbAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [AbCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? AbColors.black : AbColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AbSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      /// Search bar
                      const SizedBox(height: AbSizes.spaceBtwItems),
                      const AbSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: AbSizes.spaceBtwSections),

                      /// Feaured Brands
                      AbSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                        showActionButton: true,
                      ),
                      const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

                      Obx(() {
                        if (brandController.isLoading.value)
                          return const AbBrandShimmer();
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }
                        return AbGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return BrandCard(brand: brand, showBoarder: true);
                          },
                        );
                      }),
                    ],
                  ),
                ),
                bottom: AbTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => AbCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}

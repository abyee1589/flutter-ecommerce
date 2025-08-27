import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/shimmers/brands_shimmer.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const AbAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Hading
              const AbSectionHeading(title: 'Brands'),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Brands
              Obx(() {
                if (brandController.isLoading.value)
                  return const AbBrandShimmer();
                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: Colors.white),
                    ),
                  );
                }
                return AbGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) {
                    final brand = brandController.allBrands[index];

                    return BrandCard(
                      showBoarder: true,
                      brand: brand,
                      onTap: () => Get.to(() => const BrandProducts()),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

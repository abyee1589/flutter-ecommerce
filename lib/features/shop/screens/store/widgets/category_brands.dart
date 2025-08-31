import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_show_case.dart';
import 'package:flutter_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/shimmers/boxes_shimmer.dart';
import 'package:flutter_app/utils/shimmers/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return FutureBuilder(
      future: brandController.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        final loader = const Column(
          children: [
            AbListTileShimmer(),
            SizedBox(height: AbSizes.spaceBtwItems),
            AbBoxesShimmer(),
            SizedBox(height: AbSizes.spaceBtwItems),
          ],
        );
        final widget = AbCloudHelperFunctions.checkMultipleRecordState(
          snapshot: snapshot,
          loader: loader,
        );
        if (widget != null) return widget;

        final brands = snapshot.data!;
        return ListView.separated(
          separatorBuilder: (_, _) => const SizedBox(width: AbSizes.spaceBtwItems / 2),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: brandController.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                  final widget =
                      AbCloudHelperFunctions.checkMultipleRecordState(
                        snapshot: snapshot,
                        loader: loader,
                      );
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                return AbBrandshowcase( brand: brand, images: products.map((product) => product.thumbnail).toList());
              },
            ); 
          },
        );
      },
    );
  }
}

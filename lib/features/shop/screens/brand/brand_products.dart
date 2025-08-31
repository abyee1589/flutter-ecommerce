import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_app/features/shop/controllers/brand_controller.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/shimmers/vertical_product_shimmer.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: AbAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              BrandCard(showBoarder: true, brand: brand),
              FutureBuilder(
                future: brandController.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  final loader = const AbVerticalProductShimmer();
                  final widget =
                      AbCloudHelperFunctions.checkMultipleRecordState(
                        snapshot: snapshot,
                        loader: loader,
                      );
                  if (widget != null) return widget;
                  final brandProducts = snapshot.data!;
                  return AbSortableProducts(products: brandProducts);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

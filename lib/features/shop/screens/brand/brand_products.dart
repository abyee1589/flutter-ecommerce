import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AbAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(AbSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Detail
            AbBrandCard(showBorder: true),
            SizedBox(height: AbSizes.spaceBtwSections),

            AbSortableProducts(products: [],),
          ],
        ),
      ),
      ),
    );
  }
}
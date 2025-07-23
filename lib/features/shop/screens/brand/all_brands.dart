import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AbAppBar(title: Text('Brand'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Hading
             const AbSectionHeading(title: 'Brands'),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Brands
              AbGridLayout(
                itemCount: 10, 
                mainAxisExtent: 80,
                itemBuilder: (context, index) => AbBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
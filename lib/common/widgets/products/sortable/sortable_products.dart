import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AbSortableProducts extends StatelessWidget {
  const AbSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Name',' Higher Price', 'Lower price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
        ),
        const SizedBox(height: AbSizes.spaceBtwSections),
    
        /// Products
        AbGridLayout(
          itemCount: 8, 
          itemBuilder: (_, index) => const AbProductCardVertical()
        ),
      ],
    );
  }
}
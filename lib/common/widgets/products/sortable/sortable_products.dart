import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbSortableProducts extends StatelessWidget {
  const AbSortableProducts({
    super.key, 
    required this.products
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance;
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {
            value = controller.selectedSortOption.value;
            controller.sortProducts(value);
          },
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),
        ),
        const SizedBox(height: AbSizes.spaceBtwSections),

        /// Products
        Obx(
          () => AbGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                AbProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}

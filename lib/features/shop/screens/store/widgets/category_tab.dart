import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/shimmers/vertical_product_shimmer.dart';
import 'package:get/get.dart';

class AbCategoryTab extends StatelessWidget {
  const AbCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              AbRoundedContainer(
                showBorder: true,
                borderColor: AbColors.darkGrey,
                backgroundColor: Colors.transparent,
                margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
                child: Column(
                  children: [
                    /// Brands
                    CategoryBrands(category: category),
                    const SizedBox(height: AbSizes.spaceBtwItems),
                  ]
                )
              ),

              /// Products
              FutureBuilder(
                future: categoryController.getCategoryProducts(
                  categoryId: category.id,
                ),
                builder: (context, snapshot) {
                  final loader = const AbVerticalProductShimmer();
                  final widget =
                      AbCloudHelperFunctions.checkMultipleRecordState(
                        snapshot: snapshot,
                        loader: loader,
                      );
                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return Column(
                    children: [
                      AbSectionHeading(
                        title: 'You might also like',
                        showActionButton: true,
                        onPressed: () => Get.to(() => AllProducts(
                          title: category.name, 
                          futureMethod: categoryController.getCategoryProducts(categoryId: category.id, limit: -1)
                        )),
                      ),
                      const SizedBox(height: AbSizes.spaceBtwItems),
                      AbGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) {
                          final product = products[index];
                          return AbProductCardVertical(
                            product: product,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),    
            ],
          ),
        ),
      ],
    );
  }
}

// class AbCategoryTab extends StatefulWidget {
//   const AbCategoryTab({super.key, required this.category});
//   final CategoryModel category;

//   @override
//   State<AbCategoryTab> createState() => _AbCategoryTabState();
// }

// class _AbCategoryTabState extends State<AbCategoryTab> {
//   late final ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scrollbar(
//       controller: _scrollController,
//       thumbVisibility: true,
//       child: ListView(
//         shrinkWrap: true,
//         controller: _scrollController,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(AbSizes.defaultSpace),
//             child: Column(
//               children: [
//                 AbRoundedContainer(
//                   showBorder: true,
//                   borderColor: AbColors.darkGrey,
//                   backgroundColor: Colors.transparent,
//                   margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
//                   child: Padding(
//                     padding: const EdgeInsets.all(AbSizes.defaultSpace),
//                     child: Column(
//                       children: [
//                         /// Brand with prouducts count
//                         // const BrandCard(showBoarder: false),

//                         /// Brands

//                         /// Products
//                         AbSectionHeading(
//                           title: 'You may also like',
//                           showActionButton: true,
//                           onPressed: () {},
//                         ),
//                         const SizedBox(height: AbSizes.spaceBtwItems),

//                         AbGridLayout(
//                           itemCount: 4,
//                           itemBuilder: (_, index) => AbProductCardVertical(
//                             product: ProductModel.empty(),
//                           ),
//                         ),
//                         const SizedBox(height: AbSizes.spaceBtwSections),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

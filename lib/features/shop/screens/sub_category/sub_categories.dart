import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/shimmers/horizontal_product_shimmer.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return Scaffold(
      appBar: AbAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              AbRoundedImage(width: 200, imageUrl: category.image, applyImageRadius: true, isNetworkImage: true),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                future: categoryController.getSubcategoriesWithProducts(category.id),
                builder: (context, snapshot) {
                  final loader = const AbHorizontalProductShimmer();
                  final widget = AbCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;


                  final data = snapshot.data!; // Map<CategoryModel, List<ProductModel>>

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: data.entries.map((entry) {
                      final subCategory = entry.key;
                      final products = entry.value;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,                    
                        children: [
                          AbSectionHeading(
                            title: subCategory.name,
                            onPressed: () => Get.to(() => AllProducts(
                              title: subCategory.name,
                              futureMethod: categoryController.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                            )), 
                            showActionButton: true
                            ),
                          const SizedBox(height: AbSizes.spaceBtwItems / 2),
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 8),
                              itemBuilder: (_, i) => AbProductCardHorizontal(product: products[i]),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  );
                },
              ), 
            ],
          ),
        ),
      ),
    );
  }
}


// FutureBuilder(
//   future: categoryController.getSubCategorries(category.id),
//   builder: (context, snapshot) {
//     final loader = const AbHorizontalProductShimmer();
//     final widget = AbCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
//     if(widget != null) return widget;

//     final subCategories = snapshot.data!;

//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: subCategories.length,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (_, index){
        
//         final subCategory = subCategories[index];
//         return FutureBuilder(
//           future: categoryController.getCategoryProducts(categoryId: subCategory.id),
//           builder: (context, snapshot) {
//             final widget = AbCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
//             if(widget != null) return widget;

//             final products = snapshot.data!;

//             return Column(
//               children: [
//                 /// Heading
//                 AbSectionHeading(
//                   title: subCategory.name, 
//                   onPressed: () => Get.to(() => AllProducts(
//                     title: subCategory.name,
//                     futureMethod: categoryController.getCategoryProducts(categoryId: subCategory.id, limit: -1),
//                   )), 
//                   showActionButton: true
//                 ),
//                 const SizedBox(height: AbSizes.spaceBtwItems / 2),
            
//                 SizedBox(
//                   height: 120,
//                   child: ListView.separated(
//                     itemCount: products.length,
//                     scrollDirection: Axis.horizontal,
//                     separatorBuilder: (context, index) => const SizedBox(width: AbSizes.spaceBtwItems),
//                     itemBuilder: (context, index) => AbProductCardHorizontal(product: products[index]),
//                   ),
//                 ),
//               ],
//             );
//           }
//         );
//       },
//     );
//   }
// ),
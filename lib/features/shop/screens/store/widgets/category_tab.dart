import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_show_case.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';


class AbCategoryTab extends StatefulWidget {
  const AbCategoryTab({super.key});

  @override
  State<AbCategoryTab> createState() => _AbCategoryTabState();
}

class _AbCategoryTabState extends State<AbCategoryTab> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: ListView(
        shrinkWrap: true,
        controller: _scrollController,
        children: [Padding(
              padding: const EdgeInsets.all(AbSizes.defaultSpace),
              child: Column(
                children: [
                  AbRoundedContainer(
                    showBorder: true,
                    borderColor: AbColors.darkGrey,
                    backgroundColor: Colors.transparent,
                    margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
                    child: Padding(
                      padding: const EdgeInsets.all(AbSizes.defaultSpace),
                      child: Column(children: [
                        /// Brand with prouducts count
                        const AbBrandCard(showBorder: false),

                        /// Brands
                        const AbBrandshowcase(images: [
                          AbImages.clothIcon, 
                          AbImages.clothIcon, 
                          AbImages.clothIcon, 
                        ]),
                      
                        /// Products
                        AbSectionHeading( title: 'You may also like', showActionButton: true, onPressed: (){}),
                        const SizedBox(height: AbSizes.spaceBtwItems),
                      
                        AbGridLayout(itemCount: 4, itemBuilder: (_, index) => const AbProductCardVertical()),
                        const SizedBox(height: AbSizes.spaceBtwSections),
                      ]),
                    ),
                  ),
                ],
              ),
            ),]
      ),
    );
  }
}



// class AbCategoryTab extends StatelessWidget {
//   const AbCategoryTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       children: [Padding(
//               padding: const EdgeInsets.all(AbSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   AbRoundedContainer(
//                     showBorder: true,
//                     borderColor: AbColors.darkGrey,
//                     backgroundColor: Colors.transparent,
//                     margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
//                     child: Padding(
//                       padding: const EdgeInsets.all(AbSizes.defaultSpace),
//                       child: Column(children: [
//                         /// Brand with prouducts count
//                         const AbBrandCard(showBorder: false),

//                         /// Brands
//                         const AbBrandshowcase(images: [
//                           AbImages.clothIcon, 
//                           AbImages.clothIcon, 
//                           AbImages.clothIcon, 
//                         ]),
                      
//                         /// Products
//                         AbSectionHeading( title: 'You may also like', showActionButton: true, onPressed: (){}),
//                          const SizedBox(height: AbSizes.spaceBtwItems),
                      
//                         AbGridLayout(itemCount: 4, itemBuilder: (_, index) => const AbProductCardVertical()),
//                         const SizedBox(height: AbSizes.spaceBtwSections),
//                       ]),
//                     ),
//                   ),
//                 ],
//               ),
//             ),]
//     );
//   }
// }

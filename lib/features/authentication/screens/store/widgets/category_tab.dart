import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_card.dart';
import 'package:flutter_app/common/widgets/products/brand_card/brand_show_case.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class AbCategoryTab extends StatelessWidget {
  const AbCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(AbSizes.defaultSpace),
            child: Column(
              children: [
                AbRoundedContainer(
                  showBorder: true,
                  borderColor: AbColors.darkGrey,
                  backgroundColor: Colors.transparent,
                  margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
                  child: Column(children: [
                    /// Brand with prouducts count
                    const AbBrandCard(showBorder: false),

                    /// Brand Top 3 product images
                    const AbBrandshowcase(images: [
                      AbImages.productImage1, 
                      AbImages.productImage1, 
                      AbImages.productImage1, 
                    ]),

                    /// Products
                    AbSectionHeading( title: 'You may also like', showActionButton: true, onPressed: (){}),
                    const SizedBox(height: AbSizes.spaceBtwItems),
                  ],
                ),
                ),
              ],
            ),
          );
  }
}
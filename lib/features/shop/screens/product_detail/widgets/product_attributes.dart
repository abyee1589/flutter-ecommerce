
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/chip/ab_choice_chip.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbProductAttiributes extends StatelessWidget {
  const AbProductAttiributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute pricing and Description
        AbRoundedContainer(
          padding: const EdgeInsets.all(AbSizes.md),
          backgroundColor: dark ? AbColors.darkerGrey : AbColors.light,
          child: Column(
            children: [
              
              /// Title, Price & Stock Status
              Row(
                children: [
                  const AbSectionHeading(title: 'Variation'),
                  const SizedBox(width: AbSizes.spaceBtwItems),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const AbProductTitleText(title: 'Price', smallSize: true),
                          const SizedBox(width: AbSizes.spaceBtwItems),
                    
                          /// Actual Price
                          Text(
                            '\$25', 
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)
                          ),
                          const SizedBox(width: AbSizes.spaceBtwItems),
                    
                          /// Sale Price
                          const AbProductPriceText(price: '20')
                        ]),
                    
                        /// Stock
                        Row(
                          children: [
                            const AbProductTitleText(title: 'Stock', smallSize: true),
                            const SizedBox(width: AbSizes.spaceBtwItems),
                            Text('In Stock', style: Theme.of(context).textTheme.headlineMedium),
                          ],
                        ),
                    
                        /// Variation Description
                        const AbProductTitleText(
                          title: 'This is the description of the product and it can go up to maximum of 4 lines',
                          smallSize: true,
                          maxLines: 4,)
                    
                      ],
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),

        /// Attributes
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AbSectionHeading(title: 'Colors'),
            const SizedBox(height: AbSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AbChoiChip(text: 'Green', selected: true, onSelected: (value){}),
                AbChoiChip(text: 'Blue', selected: false, onSelected: (value){}),
                AbChoiChip(text: 'Yellow', selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AbSectionHeading(title: 'Sizes'),
            const SizedBox(height: AbSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AbChoiChip(text: 'EU 34', selected: true, onSelected: (value){}),
                AbChoiChip(text: 'EU 36', selected: false, onSelected: (value){}),
                AbChoiChip(text: 'EU 38', selected: false, onSelected: (value){}),
              ],
            )
          ],
        )
      ],
    );
  }
}


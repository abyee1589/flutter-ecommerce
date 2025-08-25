import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/chip/ab_choice_chip.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class AbProductAttiributes extends StatelessWidget {
  const AbProductAttiributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// Selected Attribute pricing and Description
          // if (controller.selectedVariation.value.id.isNotEmpty)
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
                          Row(
                            children: [
                              const AbProductTitleText(
                                title: 'Price',
                                smallSize: true,
                              ),
                              const SizedBox(width: AbSizes.spaceBtwItems),

                              /// Actual Price
                              Text(
                                '\$${controller.getVariationPrice()}',
                                style: Theme.of(context).textTheme.titleSmall!
                                    .apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              const SizedBox(width: AbSizes.spaceBtwItems),

                              /// Sale Price
                              AbProductPriceText(
                                price: '\$${controller.getVariationPrice()}',
                              ),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const AbProductTitleText(
                                title: 'Stock',
                                smallSize: true,
                              ),
                              const SizedBox(width: AbSizes.spaceBtwItems),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                            ],
                          ),

                          /// Variation Description
                          AbProductTitleText(
                            title:
                                controller
                                    .selectedVariation
                                    .value
                                    .description ??
                                '',
                            smallSize: true,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AbSectionHeading(title: attribute.name ?? ''),
                      const SizedBox(height: AbSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute
                                    .name!] ==
                                attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                  product.productVariations!,
                                  attribute.name!,
                                )
                                .contains(attributeValue);
                            return AbChoiChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (isSelected) {
                                      if (isSelected && available) {
                                        controller.onAttributesSeleceted(
                                          product,
                                          attribute.name ?? '',
                                          attributeValue,
                                        );
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

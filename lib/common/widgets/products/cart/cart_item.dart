import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_app/features/shop/models/cart_item_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbCartItem extends StatelessWidget {
  const AbCartItem({super.key, required this.cartItem});
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        AbRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AbSizes.sm),
          backgroundColor: dark ? AbColors.darkerGrey : AbColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(width: AbSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AbBrandTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: AbProductTitleText(title: cartItem.title, maxLines: 1),
              ),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries
                      .map(
                        (variation) => TextSpan(
                          children: [
                            TextSpan(
                              text: '${variation.key}:  ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: variation.value,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const TextSpan(text: '    '), // Add spacing between pairs
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

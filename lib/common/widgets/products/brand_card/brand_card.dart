import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, this.showBoarder = false, required this.brand, this.onTap});

  final bool showBoarder;
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: AbRoundedContainer(
        padding: const EdgeInsets.all(AbSizes.sm),
        showBorder: false,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: AbCircularImage(
                isNetworkImage: true,
                imageUrl: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? AbColors.white : AbColors.black,
              ),
            ),
            const SizedBox(width: AbSizes.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbBrandTextWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

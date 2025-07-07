import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';


class AbGridLayout extends StatelessWidget {
  const AbGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: AbRoundedContainer(
        padding: const EdgeInsets.all(AbSizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///
            AbCircularImage(
              isNetworkImage: false,
              image: AbImages.clothIcon,
              backgroundColor: Colors.transparent,
              overlayColor: dark ? AbColors.white : AbColors.black,
            ),
            const SizedBox(width: AbSizes.spaceBtwItems / 2),
      
            /// Text
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AbBrandTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large,),
                Text('256 Products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
                  );
  }
}
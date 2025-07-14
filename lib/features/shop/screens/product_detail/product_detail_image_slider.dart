import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbProductImageSlider extends StatelessWidget {
  const AbProductImageSlider({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return AbCurvedEdgeWidget(
      child: Container(
        color: dark ? AbColors.darkGrey : AbColors.light,
        child: Stack(
          children: [
            /// main large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(AbSizes.productImageRadius * 2),
                child: Image(image: AssetImage(AbImages.productImage1)),
              ),
            ),
    
    
            /// Image slider
            Positioned(
              right: 0,
              bottom: 10,
              left: AbSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated( 
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, _) => const SizedBox(width: AbSizes.spaceBtwItems), 
                  itemBuilder: (_, index) => AbRoundedImage(
                    width: 80,
                    backgroundColor: dark ? AbColors.black : AbColors.white,
                    border: Border.all(color: AbColors.primary),
                    padding: const EdgeInsets.all(AbSizes.sm),
                    imageUrl: AbImages.clothIcon),
                ),
              ),
            ),
    
            /// Appbar icons
            const AbAppBar(
              showBackArrow: true,
              actions: [
                AbCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbVerticalImageText extends StatelessWidget {
  const AbVerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = AbColors.white, 
    this.backgroundColor,
    this.onTap,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsGeometry.only(right: AbSizes.spaceBtwItems),
        child: Column(
          children: [
            
            /// Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(AbSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? AbColors.black : AbColors.white),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: AbColors.dark,),
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwItems / 2),

            /// Text
            SizedBox(
              width: 55,
              child: Text(title, 
                style: Theme.of(context).textTheme.labelMedium!.apply(color: AbColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



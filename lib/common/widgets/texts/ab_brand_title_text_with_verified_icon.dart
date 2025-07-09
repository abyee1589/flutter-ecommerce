import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AbBrandTextWithVerifiedIcon extends StatelessWidget {
  const AbBrandTextWithVerifiedIcon({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.textColor, 
    this.iconColor = AbColors.primary, 
    this.textAlign = TextAlign.center, 
    this.brandTextSize = TextSizes.small,
  });
  
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: AbBrandTitleText(
            title: title, 
            textAlign: textAlign,
            color: textColor, 
            maxLines: maxLines, 
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: AbSizes.xs),
        const Icon(Iconsax.verify5, color: AbColors.primary, size: AbSizes.iconXs,)
      ],
    );
  } 
}
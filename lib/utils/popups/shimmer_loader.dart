import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class AbShimmerEffect extends StatelessWidget {
  const AbShimmerEffect({
  super.key, 
  required this.width, 
  required this.height, 
  this.radius = 15, 
  this.color
});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[200]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? AbColors.darkerGrey : AbColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
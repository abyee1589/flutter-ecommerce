import 'dart:ui_web';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbCircularImage extends StatelessWidget {
  const AbCircularImage({
    super.key, 
    this.width = 56, 
    this.height = 56, 
    this.padding = AbSizes.sm, 
    required this.image, 
    this.backgroundColor,
    this.overlayColor, 
    this.fit, 
    this.isNetworkImage = false,
  });
   final double width, height, padding;
  final String image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;


  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? ( dark ? AbColors.black : AbColors.white),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: isNetworkImage 
        ? CachedNetworkImage(
          fit: fit,
          color: overlayColor,
          imageUrl: image,
          // progressIndicatorBuilder: (context, url, downloadProgress) => AbShimmerEffect(width: 55, height: 55, radius: 55),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : Image(
          image: AssetImage(image),
          color: overlayColor ,
        ),
      ),
    );
  }
} 
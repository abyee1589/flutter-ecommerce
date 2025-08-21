
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';

class AbCircularImage extends StatelessWidget {
  const AbCircularImage({
    super.key, 
    this.width = 56, 
    this.height = 56, 
    this.padding = AbSizes.sm, 
    required this.imageUrl, 
    this.backgroundColor,
    this.overlayColor, 
    this.fit = BoxFit.cover, 
    this.isNetworkImage = false,
  });
   final double width, height, padding;
  final String imageUrl;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;

   /// Function to handle Cloudinary URL and auto append `f_auto,q_auto`
  String _processUrl(String url) {
    if (url.contains("res.cloudinary.com")) {
      // If Cloudinary URL, inject `f_auto,q_auto` if not already present
      if (!url.contains("f_auto")) {
        // Example: split after /upload/
        return url.replaceFirst(
          "/upload/",
          "/upload/f_auto,q_auto/",
        );
      }
    }
    return url; // return unchanged if not Cloudinary
  }

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final finalUrl = _processUrl(imageUrl);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? ( dark ? AbColors.black : AbColors.white),
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage 
          ? CachedNetworkImage(
            fit: fit ?? BoxFit.contain,
            color: overlayColor,
            imageUrl: finalUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) => const AbShimmerEffect(width: 55, height: 55, radius: 55),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : Image(
            image: AssetImage(finalUrl),
            color: overlayColor ,
            fit: fit ?? BoxFit.contain,
          ),
        ),
      ),
    );
  }
} 
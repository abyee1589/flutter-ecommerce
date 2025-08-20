import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';


class AbRoundedImage extends StatelessWidget {
  const AbRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.onPressed,
    this.borderRadius = AbSizes.md,
    this.isNetworkImage = false,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

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
    final finalUrl = _processUrl(imageUrl);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(finalUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}

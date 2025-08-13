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
    this.iNetworkImage = false,
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
  final bool iNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
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
          borderRadius: applyImageRadius? BorderRadius.circular(borderRadius) : BorderRadius.zero, 
          child: Image(fit: fit, image: iNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
        ), 
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AbCircularIcon extends StatelessWidget {
  const AbCircularIcon({
    super.key, 
    this.width, 
    this.height, 
    this.size, 
    required this.icon, 
    this.color, 
    this.backgroundColor, 
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor
         ?? (dark ? AbColors.black.withOpacity(0.9) : (AbColors.white.withOpacity(0.9))),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size) ),
    
    );
  }
}
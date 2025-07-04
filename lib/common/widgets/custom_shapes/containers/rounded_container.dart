import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class AbRoundedContainer extends StatelessWidget {
  const AbRoundedContainer({
    super.key,
    this.child, 
    this.width, 
    this.height, 
    this.radius =AbSizes.borderRadiusLg, 
    this.showBorder = false,
    this.padding,
    this.margin,  
    this.backgroundColor = AbColors.white, 
    this.borderColor = AbColors.borderPrimary, 
    
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry?  margin;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
      
    );
  }
}
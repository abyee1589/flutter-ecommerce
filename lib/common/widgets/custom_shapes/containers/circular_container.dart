import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key, this.width, this.height, this.radius, this.padding, this.child, required this.backgroundColor,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: AbColors.textWhite.withOpacity(0.1),
    
      ),
      
    );
  }
}
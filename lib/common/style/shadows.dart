import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';

class AbShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: AbColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: AbColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
  
}
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';

class AbChipTheme {
  const AbChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AbColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: AbColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AbColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AbColors.darkerGrey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: AbColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AbColors.white,
  );
}
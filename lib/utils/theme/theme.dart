import 'package:ab_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ab_store/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AbAppTheme {
  const AbAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: AbTextTheme.lightTextTheme,
    chipTheme: AbChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AbAppBarTheme.lightAppBarTheme,
    checkboxTheme: AbCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AbBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AbElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AbOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AbTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: AbTextTheme.darkTextTheme,
    chipTheme: AbChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AbAppBarTheme.darkAppBarTheme,
    checkboxTheme: AbCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AbBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AbElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AbOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AbTextFormFieldTheme.darkInputDecorationTheme,
  );
}

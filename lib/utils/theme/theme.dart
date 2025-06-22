import 'package:e_shop/utils/theme/customTheme/bottom_sheet_theme.dart';
import 'package:e_shop/utils/theme/customTheme/checkbox_theme.dart';
import 'package:e_shop/utils/theme/customTheme/chip_theme.dart';
import 'package:e_shop/utils/theme/customTheme/elevated_button_theme.dart';
import 'package:e_shop/utils/theme/customTheme/outlines_button_theme.dart';
import 'package:e_shop/utils/theme/customTheme/text_field_theme.dart';
import 'package:e_shop/utils/theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EAppThemme {
  EAppThemme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    chipTheme: EChipTheme.lightChipTheme,
    textTheme: ETextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: ETextTheme.darkTextTheme,
    chipTheme: EChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
  );
}

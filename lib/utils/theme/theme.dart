import 'package:e_shop/utils/theme/customTheme/appbar_theme.dart';
import 'package:e_shop/utils/theme/customTheme/bottom_sheet_theme.dart';
import 'package:e_shop/utils/theme/customTheme/checkbox_theme.dart';
import 'package:e_shop/utils/theme/customTheme/chip_theme.dart';
import 'package:e_shop/utils/theme/customTheme/elevated_button_theme.dart';
import 'package:e_shop/utils/theme/customTheme/navigation_bar_theme.dart';
import 'package:e_shop/utils/theme/customTheme/outlines_button_theme.dart';
import 'package:e_shop/utils/theme/customTheme/text_field_theme.dart';
import 'package:e_shop/utils/theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EAppThemme {
  EAppThemme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,

    // 🔧 Fix: Transparent surface tint to prevent pink overlay
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ).copyWith(surfaceTint: Colors.transparent),

    // Custom themes
    chipTheme: EChipTheme.lightChipTheme,
    textTheme: ETextTheme.lightTextTheme,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    checkboxTheme: ECheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: ENavigationBarTheme.lightNavigationBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,

    // Optional: Surface tint override for dark mode too
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ).copyWith(surfaceTint: Colors.transparent),

    // Custom themes
    chipTheme: EChipTheme.darkChipTheme,
    textTheme: ETextTheme.darkTextTheme,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    checkboxTheme: ECheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: ENavigationBarTheme.darkNavigationBarTheme,
  );
}

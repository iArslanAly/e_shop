import 'package:flutter/material.dart';

class ENavigationBarTheme {
  ENavigationBarTheme._();

  static final NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent, // optional to avoid overlay tint

        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: Colors.blue);
          }
          return const IconThemeData(color: Colors.grey);
        }),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            );
          }
          return const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          );
        }),
      );

  static final NavigationBarThemeData darkNavigationBarTheme =
      NavigationBarThemeData(
        backgroundColor: Colors.black,
        indicatorColor: Colors.transparent,

        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: Colors.blue);
          }
          return const IconThemeData(color: Colors.grey);
        }),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            );
          }
          return const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          );
        }),
      );
}

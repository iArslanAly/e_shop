import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: EColors.darkGrey.withValues(alpha: 0.2),
    offset: const Offset(0, 2),
    blurRadius: 50,
    spreadRadius: 7,
  );
  static final horizontalProductShadow = BoxShadow(
    color: EColors.darkGrey.withValues(alpha: 0.2),
    offset: const Offset(2, 0),
    blurRadius: 50,
    spreadRadius: 7,
  );
}

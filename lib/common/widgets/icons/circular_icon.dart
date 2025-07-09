import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECircularIcons extends StatelessWidget {
  const ECircularIcons({
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : EHelperFunctions.isDarkMode(context)
            ? Colors.black.withValues(alpha: 0.9)
            : Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: Icon(icon, size: size, color: color),
        onPressed: onPressed,
        splashRadius: size ?? 24,
      ),
    );
  }
}

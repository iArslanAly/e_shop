import 'package:flutter/material.dart';

class ECircularContaiiner extends StatelessWidget {
  const ECircularContaiiner({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.padding,
    this.color,
    this.child,
    this.margin,
  });

  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double finalWidth = width ?? 400;
    final double finalHeight = height ?? 400;

    final double finalRadius = radius != null
        ? radius!
        : (width != null && height != null ? (width! + height!) / 2 : 400);

    return Container(
      width: finalWidth,
      height: finalHeight,
      margin: margin,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(finalRadius),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class ECircularContaiiner extends StatelessWidget {
  const ECircularContaiiner({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding,
    this.color,
    this.child,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;

  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: child,
    );
  }
}

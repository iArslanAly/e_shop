import 'package:e_shop/common/widgets/customShapes/curvedEdges/curve_edges.dart';
import 'package:flutter/material.dart';

class CustomCurveEdegesWidget extends StatelessWidget {
  const CustomCurveEdegesWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: ECustomCurveEdges(), child: child);
  }
}

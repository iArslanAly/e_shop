import 'package:flutter/material.dart';

class ECustomCurveEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from top-left
    path.lineTo(0, size.height);

    // First curve (bottom-left corner)
    final firstCurveControl = Offset(0, size.height - 20);
    final firstCurveEnd = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      firstCurveControl.dx,
      firstCurveControl.dy,
      firstCurveEnd.dx,
      firstCurveEnd.dy,
    );

    // Middle straight line
    path.lineTo(size.width - 30, size.height - 20);

    // Third curve (bottom-right corner, mirroring the first)
    final thirdCurveControl = Offset(size.width, size.height - 20);
    final thirdCurveEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
      thirdCurveControl.dx,
      thirdCurveControl.dy,
      thirdCurveEnd.dx,
      thirdCurveEnd.dy,
    );

    // Top-right corner
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

import 'package:e_shop/common/widgets/customShapes/containers/circular_container.dart';
import 'package:e_shop/common/widgets/customShapes/curvedEdges/curve_edges_widget.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EPrimeryHeeaderContainer extends StatelessWidget {
  const EPrimeryHeeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomCurveEdegesWidget(
      child: Container(
        color: EColors.primary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: ECircularContaiiner(
                  color: EColors.white.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: ECircularContaiiner(
                  color: EColors.white.withValues(alpha: 0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

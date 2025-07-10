import 'package:e_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EGridLayout extends StatelessWidget {
  const EGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = ESizes.d288dp,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ESizes.gridViewSpacing),
      child: GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ESizes.d2,
          crossAxisSpacing: ESizes.gridViewSpacing,
          mainAxisSpacing: ESizes.gridViewSpacing,
          childAspectRatio: ESizes.pointSeven,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

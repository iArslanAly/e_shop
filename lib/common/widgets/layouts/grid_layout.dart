import 'package:e_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EGridLayout extends StatelessWidget {
  const EGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ESizs.gridViewSpacing),
      child: GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: ESizs.gridViewSpacing,
          mainAxisSpacing: ESizs.gridViewSpacing,
          childAspectRatio: 0.7,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

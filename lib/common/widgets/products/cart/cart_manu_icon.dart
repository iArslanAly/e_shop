

import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ECartCounterIcon extends StatelessWidget {
  const ECartCounterIcon({
    super.key,
    required this.iconColor,
    this.onPressed,
    required this.cartCount,
  });
  final Color iconColor;
  final VoidCallback? onPressed;
  final String cartCount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Iconsax.shopping_bag, color: EColors.white),
          onPressed: onPressed,
        ),
        Positioned(
          right: 0,
          top: 0,
          width: 18,
          height: 18,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
            child: Center(
              child: Text(
                '3',
                style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: EColors.white,
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

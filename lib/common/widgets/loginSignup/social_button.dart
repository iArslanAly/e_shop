import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(ESizes.xs),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: EColors.darkGrey, width: 1),
          ),
          child: IconButton(
            icon: Image.asset(
              EImages.google,
              height: ESizes.iconMd,
              width: ESizes.iconMd,
            ),
            onPressed: () {
              // Handle Google login
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(ESizes.xs),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: EColors.darkGrey, width: 1),
          ),
          child: IconButton(
            icon: Image.asset(
              EImages.facebook,
              height: ESizes.iconMd,
              width: ESizes.iconMd,
            ),
            onPressed: () {
              // Handle Facebook login
            },
          ),
        ),
      ],
    );
  }
}

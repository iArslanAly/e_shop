import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: EDeviceUtils.getBottomNavigationBarHeight() + 5,
      right: ESizs.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(ESizs.defaultSpace),
          backgroundColor: dark ? EColors.buttonPrimary : EColors.dark,
        ),
        onPressed: onPressed,
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';

class OnboardingDotNavigator extends StatelessWidget {
  const OnboardingDotNavigator({
    super.key,
    required this.pageController,
    required this.onDotClicked,
  });
  final PageController pageController;
  final Function(int) onDotClicked;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: EDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: ESizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: pageController,
        onDotClicked: onDotClicked,
        count: 3,
        effect: ExpandingDotsEffect(
          spacing: ESizes.spaceBtwItems,
          activeDotColor: dark ? EColors.light : EColors.dark,
          dotHeight: 6.0,
          dotWidth: 15.0,
        ),
      ),
    );
  }
}

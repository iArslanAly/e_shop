import 'package:e_shop/features/onboarding/onboardingBloc/onboarding_bloc.dart';
import 'package:e_shop/features/onboarding/screens/widgets/onboarding_next_button.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_shop/features/onboarding/screens/widgets/onboarding_dot_navigator.dart';
import 'package:e_shop/features/onboarding/screens/widgets/onboarding_page.dart';
import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/device/device_utility.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Scaffold(
        body: Stack(
          /// Horizontal Scrollable Pages
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) => {
                context.read<OnboardingBloc>().add(PageChangedEvent(index)),
              }, 
              children: [
                /// Onboarding Page 1
                OnboardiingPage(
                  title: ETextStrings.onboardingTitle1,
                  subTitle: ETextStrings.onboardingSubtitle1,
                  image: EImages.onBoardingImage1,
                ),

                /// Onboarding Page 2
                OnboardiingPage(
                  title: ETextStrings.onboardingTitle2,
                  subTitle: ETextStrings.onboardingSubtitle2,
                  image: EImages.onBoardingImage2,
                ),

                /// Onboarding Page 3
                OnboardiingPage(
                  title: ETextStrings.onboardingTitle3,
                  subTitle: ETextStrings.onboardingSubtitle3,
                  image: EImages.onBoardingImage3,
                ),
              ],
            ),
            /// Skip Button
            Positioned(
              top: EDeviceUtils.getAppBarHeight(),
              right: ESizs.defaultSpace,
              child: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Routes.login),
                child: Text(
                  ETextStrings.skip,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: EHelperFunctions.isDarkMode(context)
                        ? EColors.light
                        : EColors.dark,
                  ),
                ),
              ),
            ),
            /// Dot Navigation SmoothPageIndicator
            OnboardingDotNavigator(
              pageController: pageController,
              onDotClicked: (index) {
                context.read<OnboardingBloc>().add(PageChangedEvent(index));
              },
            ),

            /// Circular Button
            OnBoardingNextButton(
              onPressed: () {
                final bloc = context.read<OnboardingBloc>();
                final currentPage = bloc.state.currentPage;

                if (currentPage < 2) {
                  bloc.add(SkipToLastPageEvent());
                } else {
                  Navigator.pushReplacementNamed(context, Routes.login);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

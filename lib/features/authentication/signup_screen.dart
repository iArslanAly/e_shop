import 'package:e_shop/common/styles/spacing_styles.dart';
import 'package:e_shop/common/widgets/form_divider.dart';
import 'package:e_shop/common/widgets/social_button.dart';
import 'package:e_shop/features/authentication/screens/widgets/signup_form.dart';

import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: ESpacingStyles.paddingWithAppBarHieght,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ETextStrings.authRegisterTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32.0),
            // signup form here
            SignupForm(),
            const SizedBox(height: ESizs.spaceBtwSections),
            // Divider for social signup section
            EFormDivider(text: ETextStrings.authSocialSignupTitle),
            const SizedBox(height: ESizs.spaceBtwSections),
            // Social signup buttons
            TSocialButton(),
          ],
        ),
      ),
    );
  }
}

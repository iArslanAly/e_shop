import 'package:e_shop/common/styles/spacing_styles.dart';
import 'package:e_shop/common/widgets/form_divider.dart';
import 'package:e_shop/common/widgets/social_button.dart';
import 'package:e_shop/features/authentication/widgets/login_form.dart';

import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: ESpacingStyles.paddingWithAppBarHieght,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: ESizs.imageHeight,

                  image: AssetImage(EImages.eStore),
                ),
                const SizedBox(height: ESizs.sm),

                Text(
                  ETextStrings.authLoginTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: ESizs.sm),

                Text(
                  ETextStrings.authLoginSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: ESizs.spaceBtwSections),

            // Add your login form here
            ELoginForm(),
            const SizedBox(height: ESizs.spaceBtwSections),
            EFormDivider(text: ETextStrings.authSocialLoginTitle),
            SizedBox(height: ESizs.spaceBtwSections),
            // Social login buttons
            TSocialButton(),
          ],
        ),
      ),
    );
  }
}

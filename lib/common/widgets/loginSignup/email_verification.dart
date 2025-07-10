import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({
    super.key,
    this.onPress,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              image,
              width: EHelperFunctions.screenWidth(context) * 0.6,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: ESizes.spaceBtwItems),
            Text(
              'iarslanaly@yahooo.com',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: ESizes.defaultSpace),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: ESizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPress,
                child: const Text(ETextStrings.authContinue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              ETextStrings.authForgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: ESizes.spaceBtwItems),
            Text(
              ETextStrings.authForgotPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ESizes.defaultSpace),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ETextStrings.authEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: ESizes.defaultSpace),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle password reset logic here
                  // For example, send a reset link to the provided email
                  Navigator.pushNamed(context, Routes.resetPassword);
                },
                child: const Text(ETextStrings.authSubmit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

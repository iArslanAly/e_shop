import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizs.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(EImages.authVerifyImage),
              Text(
                ETextStrings.authVerifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizs.spaceBtwItems),
              Text(
                'iarslanaly@yahooo.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizs.defaultSpace),
              Text(
                ETextStrings.authVerifyEmailSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: ESizs.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to resend verification email
                    // This could be a function that calls your backend service
                    // to resend the verification email.
                    Navigator.pushNamed(context, '/emailVerified');
                  },
                  child: const Text(ETextStrings.authContinue),
                ),
              ),
              const SizedBox(height: ESizs.spaceBtwItems),
              TextButton(
                onPressed: () {},
                child: const Text(ETextStrings.authresendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

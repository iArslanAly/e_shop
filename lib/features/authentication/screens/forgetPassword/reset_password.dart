import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.login,
                (route) => false,
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizs.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                EImages.authVerifyImage,
                width: EHelperFunctions.screenWidth(context) * 0.6,
              ),
              Text(
                ETextStrings.authPasswordRestEmailSentTitle,
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
                ETextStrings.authPasswordRestEmailSentSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizs.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle password reset logic here
                    // For example, navigate to a success screen or perform further actions
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.login,
                      (route) => false,
                    );
                  },
                  child: const Text(ETextStrings.done),
                ),
              ),
              const SizedBox(height: ESizs.defaultSpace),
              TextButton(
                onPressed: () {
                  // Handle resend email logic here
                  // For example, show a snackbar or perform an action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(ETextStrings.authResendEmail),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(    
                  ETextStrings.authResendEmail,
                  style: Theme.of(context).textTheme.labelMedium
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

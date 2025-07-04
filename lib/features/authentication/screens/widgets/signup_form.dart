
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: ETextStrings.authFirstName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: ESizs.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: ETextStrings.authLastName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ESizs.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user_add),
              labelText: ETextStrings.authUsername,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: ESizs.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: ETextStrings.authPhone,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: ESizs.spaceBtwInputFields),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: ETextStrings.authPassword,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: ESizs.spaceBtwInputFields),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: ETextStrings.authConfirmPassword,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: ESizs.spaceBtwInputFields),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ESizs.lg,
                  width: ESizs.lg,
                  child: Checkbox(value: false, onChanged: (value) {}),
                ),
                const SizedBox(width: ESizs.defaultSpace),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ETextStrings.authSignupTerms,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: ETextStrings.authTermsAndConditions,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: dark ? EColors.white : EColors.primary,
                              ),
                        ),
                        TextSpan(
                          text: ETextStrings.authand,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: ' ${ETextStrings.authPrivacyPolicy}',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: dark ? EColors.white : EColors.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ESizs.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle login action
              },
              child: Text(ETextStrings.authRegisterButton),
            ),
          ),
        ],
      ),
    );
  }
}

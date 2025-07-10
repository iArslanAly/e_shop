import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ELoginForm extends StatelessWidget {
  const ELoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: ETextStrings.authEmail,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: ETextStrings.authPassword,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                      // Handle checkbox state change
                    },
                  ),
                  Text(ETextStrings.authRememberMe),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle forgot password action
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: Text(ETextStrings.authForgotPasswordButton),
              ),
            ],
          ),
          const SizedBox(height: ESizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle login action
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
              child: Text(ETextStrings.authLoginButton),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
              child: Text(ETextStrings.authRegisterButton),
            ),
          ),
        ],
      ),
    );
  }
}

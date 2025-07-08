import 'package:e_shop/common/widgets/loginSignup/email_verification.dart';
import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          EmailVerification(
            image: EImages.authVerifyImage,
            title: ETextStrings.authVerifyEmailTitle,
            subtitle: ETextStrings.authVerifyEmailSubtitle,
            onPress: () {
              // Logic to resend verification email
              // This could be a function that calls your backend service
              // to resend the verification email.
              Navigator.pushNamed(context, '/emailVerified');
            },
          ),
          TextButton(
            onPressed: () {},
            child: const Text(ETextStrings.authResendEmail),
          ),
        ],
      ),
    );
  }
}

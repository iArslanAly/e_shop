import 'package:e_shop/common/widgets/loginSignup/email_verification.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class EmailVerifiedScreen extends StatelessWidget {
  const EmailVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      ),
      body: EmailVerification(
        image: EImages.authVerifiedImage,
        title: ETextStrings.authVerifyEmailSuccessTitle,
        subtitle: ETextStrings.authVerifyEmailSuccessSubtitle,
        onPress: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
            (route) => false,
          );
        },
      ),
    );
  }
}

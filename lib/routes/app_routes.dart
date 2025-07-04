import 'package:e_shop/features/authentication/screens/login_screen.dart';
import 'package:e_shop/features/authentication/signup_screen.dart';
import 'package:e_shop/features/onboarding/screens/onboarding.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${Routes.noRouteDefined} ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}

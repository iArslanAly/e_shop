import 'package:e_shop/features/authentication/screens/login_screen.dart';
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
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const Placeholder(
            child: Center(child: Text('Signup Screen Placeholder')),
          ),
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

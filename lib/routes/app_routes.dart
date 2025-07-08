import 'package:e_shop/features/authentication/screens/forgetPassword/forget_password.dart';
import 'package:e_shop/features/authentication/screens/forgetPassword/reset_password.dart';
import 'package:e_shop/features/authentication/screens/verifyEmail/email_verfied_screen.dart';
import 'package:e_shop/features/authentication/screens/login/login_screen.dart';
import 'package:e_shop/features/authentication/screens/signup/signup_screen.dart';
import 'package:e_shop/features/authentication/screens/verifyEmail/verify_email_screen.dart';
import 'package:e_shop/features/navigation/bloc/navigation_bloc.dart';
import 'package:e_shop/features/navigation/screens/navigation_bar.dart';
import 'package:e_shop/features/onboarding/screens/onboarding.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NavigationBloc(),
            child: const AppBottomNavigationBar(),
          ),
          settings: settings,
        );
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
          settings: settings,
        );
      case Routes.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => VerifyEmailScreen(),
          settings: settings,
        );
      case Routes.emailVerified:
        return MaterialPageRoute(
          builder: (_) => const EmailVerifiedScreen(),
          settings: settings,
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
          settings: settings,
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPassword(),
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

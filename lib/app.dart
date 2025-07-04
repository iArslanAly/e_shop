import 'package:e_shop/routes/app_routes.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.onboarding,
      onGenerateRoute: AppRoutes.generateRoute,
      themeMode: ThemeMode.system,
      theme: EAppThemme.lightTheme,
      darkTheme: EAppThemme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

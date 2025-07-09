import 'package:e_shop/app.dart';
import 'package:e_shop/features/onboarding/bloc/onboarding_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication
  runApp(BlocProvider(create: (context) => OnboardingBloc(), child: MyApp()));
}

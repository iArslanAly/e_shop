// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'onboarding_bloc.dart';

class OnboardingState {
  final int currentPage;

  OnboardingState({required this.currentPage});

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(currentPage: currentPage ?? this.currentPage);
  }
  
}


part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class NextPageEvent extends OnboardingEvent {}

class PageChangedEvent extends OnboardingEvent {
  final int pageIndex;

  const PageChangedEvent(this.pageIndex);
}

class SkipToLastPageEvent extends OnboardingEvent {}

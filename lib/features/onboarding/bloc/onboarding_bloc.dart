import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int totalPages = 2;

  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<PageChangedEvent>(_onPageChange);
    on<NextPageEvent>(_onNextPage);
    on<SkipToLastPageEvent>(_skipToLastPage);
  }

  Future<void> _onPageChange(
    PageChangedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(currentPage: event.pageIndex));
  }

  Future<void> _onNextPage(
    NextPageEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    final nextPage = state.currentPage + 1;
    if (nextPage < totalPages) {
      emit(state.copyWith(currentPage: nextPage));
    }
  }

  Future<void> _skipToLastPage(
    SkipToLastPageEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    if (state.currentPage < totalPages) {
      totalPages = 2;
      emit(state.copyWith(currentPage: totalPages));
    }
  }
}

part of 'navigation_bloc.dart';

 class NavigationState extends Equatable {
  const NavigationState(this.currentIndex);
  final int currentIndex;
  @override
  List<Object> get props => [currentIndex];
}



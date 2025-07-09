// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'carousl_slider_bloc.dart';

class CarouslSliderState extends Equatable {
  const CarouslSliderState(this.index);
  final int index;

  @override
  List<Object> get props => [index];

  CarouslSliderState copyWith({
    int? index,
  }) {
    return CarouslSliderState(
      index ?? this.index,
    );
  }
}

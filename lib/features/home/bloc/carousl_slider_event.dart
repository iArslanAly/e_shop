part of 'carousl_slider_bloc.dart';

sealed class CarouslSliderEvent extends Equatable {
  const CarouslSliderEvent();

  @override
  List<Object> get props => [];
}
class SliderEvent extends CarouslSliderEvent {
  final int sliderIndex;

  const SliderEvent(this.sliderIndex);

  @override
  List<Object> get props => [sliderIndex];
}

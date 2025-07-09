import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carousl_slider_event.dart';
part 'carousl_slider_state.dart';

class CarouslSliderBloc extends Bloc<CarouslSliderEvent, CarouslSliderState> {
  CarouslSliderBloc() : super(CarouslSliderState(0)) {
    on<SliderEvent>(_onSlide);
  }
  void _onSlide(SliderEvent event, Emitter<CarouslSliderState> emit) {
    emit(state.copyWith(index: event.sliderIndex));
  }
}

import 'package:bloc/bloc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderState(indexSlider: 0));

  changeIndicatorSlider(int index) {
    emit(SliderState(indexSlider: index));
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

part 'appbar_state.dart';

class AppbarCubit extends Cubit<AppbarState> {
  AppbarCubit()
      : super(AppbarState(
            imagePath: Assets.icons.caretDown, isDropdownOpen: false));

  void changeStateBox() {
    bool newVal = state.isDropdownOpen;
    String newPath = state.imagePath;

    if (newPath == Assets.icons.caretDown) {
      newPath = Assets.icons.caretUp;
    } else {
      newPath = Assets.icons.caretDown;
    }
    emit(state.copyWith(isDropdownOpen: !newVal, imagePath: newPath));
  }
}

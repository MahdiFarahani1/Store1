import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Config/save/save_All.dart';

class ShowDevicesCubit extends Cubit<bool> {
  ShowDevicesCubit()
      : super(SaveAll.saveDevice.read('saveDevice') == null ? false : true);

  changeState(bool connectionStatus) {
    if (connectionStatus) {
      emit(true);
    } else {
      emit(false);
    }
  }

  changeStaticState() {
    bool newState = !state;
    emit(newState);
  }
}

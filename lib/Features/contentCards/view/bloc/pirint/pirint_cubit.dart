import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

part 'pirint_state.dart';

class PirintCubit extends Cubit<PirintState> {
  PirintCubit() : super(PirintState(bluetoothDevices: []));
  Future<void> fetchBluetoothDevices() async {
    emit(PirintState(bluetoothDevices: []));
    await Permission.bluetoothConnect.request();
    await Permission.bluetoothScan.request();
    if (!await FlutterBluePlus.isOn) {
      FlutterBluePlus.turnOn();
      bool isBluetoothOn = false;
      while (!isBluetoothOn) {
        await Future.delayed(Duration(seconds: 1));
        isBluetoothOn = await FlutterBluePlus.isOn;
      }
    }

    final List<BluetoothInfo> listResult =
        await PrintBluetoothThermal.pairedBluetooths;

    emit(PirintState(bluetoothDevices: listResult));
  }

  Future<void> catchNewDevice() async {
    final List<BluetoothInfo> listResult =
        await PrintBluetoothThermal.pairedBluetooths;

    emit(PirintState(bluetoothDevices: listResult));
  }
}

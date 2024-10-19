import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintPage extends StatefulWidget {
  const PrintPage({super.key});

  @override
  PrintPageState createState() => PrintPageState();
}

class PrintPageState extends State<PrintPage> {
  List<BluetoothInfo> _devices = [];
  bool _connected = false;

  @override
  void initState() {
    super.initState();
    _checkBluetoothPermissions().then((_) {
      _getBluetoothDevices();
    });
  }

  Future<void> _checkBluetoothPermissions() async {
    if (await Permission.bluetooth.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted &&
        await Permission.location.request().isGranted) {
      // Permissions are granted, proceed
    } else {
      // Handle permission denial
      print("Bluetooth permissions not granted");
    }
  }

  Future<void> _getBluetoothDevices() async {
    final List<BluetoothInfo> devices =
        await PrintBluetoothThermal.pairedBluetooths;
    setState(() {
      _devices = devices;
    });
  }

  void _connect(BluetoothInfo device) async {
    bool isConnected = await PrintBluetoothThermal.connectionStatus;
    if (!isConnected) {
      final result = await PrintBluetoothThermal.connect(
          macPrinterAddress: device.macAdress);
      setState(() {
        _connected = result;
      });
    }
  }

  Future<void> _printTextAndImage() async {
    if (_connected) {
      ByteData data = await rootBundle.load('assets/images/centerSplash.png');
      Uint8List bytes = data.buffer.asUint8List();

      List<int> listData = bytes.toList();
      await PrintBluetoothThermal.writeBytes(listData); // Image
      await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(
        size: 2,
        text: 'hi',
      ));
      await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(
        size: 2,
        text: 'world',
      ));
    } else {
      print("Printer not connected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Print'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<BluetoothInfo>(
            items: _devices
                .map((device) => DropdownMenuItem(
                      child: Text(device.name),
                      value: device,
                    ))
                .toList(),
            onChanged: (device) {
              _connect(device!);
            },
            hint: const Text('Select Printer'),
          ),
          ElevatedButton(
            onPressed: _printTextAndImage,
            child: const Text('Print'),
          ),
        ],
      ),
    );
  }
}

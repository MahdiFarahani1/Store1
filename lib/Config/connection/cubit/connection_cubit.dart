import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionInternetState> {
  ConnectionCubit()
      : super(ConnectionInternetState(
            connectivityStatus: ConnectivityStatus.disconnected));

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription streamSubscription;
  bool isDialogOpen = false;

  void checkConnection(BuildContext context) async {
    var connectivityResult = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult, context);
  }

  void _updateConnectionStatus(
      List<ConnectivityResult> result, BuildContext context) {
    if (result.contains(ConnectivityResult.none)) {
      emit(ConnectionInternetState(
          connectivityStatus: ConnectivityStatus.disconnected));

      print(" ConnectivityStatus.disconnected ______________________________");
      if (!isDialogOpen) {
        _showNoInternetDialog(
          context,
        );
      }
    } else if (result.contains(ConnectivityResult.vpn)) {
      emit(ConnectionInternetState(
          connectivityStatus: ConnectivityStatus.connected));
      print(" ConnectivityStatus.connected Vpn______________________________");
      _showVpnDialog(context);
    } else {
      emit(ConnectionInternetState(
          connectivityStatus: ConnectivityStatus.connected));
      print(" ConnectivityStatus.connected ______________________________");
      if (isDialogOpen) {
        Navigator.of(context).pop();
        isDialogOpen = false;
      }
    }
  }

  trackConnectivityChange(BuildContext context) {
    streamSubscription = _connectivity.onConnectivityChanged.listen(
      (res) {
        _updateConnectionStatus(res, context);
      },
    );
  }

  void _showVpnDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: ConstColor.getBgMain(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    Assets.images.vpn.path,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "vpn شما روشن است",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
              "برای تجربه بهتر از اپلیکیشن vpn خود را خاموش کنید..."),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text(
                "حتما",
                style: TextStyle(color: ConstColor.lightIconColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNoInternetDialog(
    BuildContext context,
  ) {
    isDialogOpen = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: ConstColor.getBgMain(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: ConstColor.getBgReverce(context))),
                  child: Image.asset(
                    Assets.images.nowifi.path,
                    height: 100,
                    width: 100,
                  ).padAll(8),
                ),
              ),
              EsaySize.gap(10),
              const Text(
                "اینترنت ندارید!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text("لطفا اتصال خود را بررسی کنید..."),
          actions: [
            TextButton(
              onPressed: () async {
                var connectivityResult =
                    await _connectivity.checkConnectivity();
                if (!connectivityResult.contains(ConnectivityResult.none)) {
                  Navigator.of(context).pop();
                  isDialogOpen = false;
                }
              },
              child: Text(
                "تلاش مجدد",
                style: TextStyle(color: ConstColor.lightIconColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}

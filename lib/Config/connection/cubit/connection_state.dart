part of 'connection_cubit.dart';

class ConnectionInternetState {
  ConnectivityStatus connectivityStatus;

  ConnectionInternetState({required this.connectivityStatus});
}

enum ConnectivityStatus { connected, disconnected }

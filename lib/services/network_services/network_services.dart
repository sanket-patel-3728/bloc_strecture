/// Class for checkConnectivity of Internet.

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../bloc/network_bloc/network_bloc.dart';

class NetworkHelper {
  static ConnectionType currentConnectionType = ConnectionType.connected;

  /// Check network status when app runs
  static Future<void> init() async {
    await Connectivity().checkConnectivity().then((result) {
      if (result == ConnectivityResult.none) {
        currentConnectionType = ConnectionType.notConnected;
        NetworkBloc().add(NetworkNotify());
      } else {
        currentConnectionType = ConnectionType.connected;
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    }).then((value) => _observeNetwork());
  }

  /// Listen Network changes.
  static void _observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        currentConnectionType = ConnectionType.notConnected;
        NetworkBloc().add(NetworkNotify());
      } else {
        currentConnectionType = ConnectionType.connected;
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }

  /// return True if Internet is Connected else return Flase
  static bool checkInternet() {
    return ConnectionType.connected == currentConnectionType;
  }
}

enum ConnectionType { connected, notConnected }

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
   static Future<NetworkStatus> getNetworkStatus() async {
    final ConnectivityResult result =
        (await Connectivity().checkConnectivity()) as ConnectivityResult;

    switch (result) {
      case ConnectivityResult.wifi:
        return NetworkStatus.wifi;
      case ConnectivityResult.mobile:
        return NetworkStatus.mobile;
      case ConnectivityResult.none:
      default:
        return NetworkStatus.none;
    }
  }
}
enum NetworkStatus { wifi, mobile, none }


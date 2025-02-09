import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

Future<bool> checkinternet() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //print(connectivityResult.toString());
      try {
        final Dio dio = Dio();
        // Perform an actual HTTP request to verify internet access
        final response = await dio.get(
          'https://www.google.com',
          options: Options(
            receiveTimeout: const Duration(seconds: 5), // 5 seconds timeout
            sendTimeout: const Duration(seconds: 5),
          ),
        );
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        // Dio throws an error if the request fails
          return false;
        
      }
    } else {
      // No network connectivity
      // print(connectivityResult.toString());
          return false;
      
    }
  }

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'check_internet_state.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  final Dio dio = Dio();

  CheckInternetCubit() : super(CheckInternetInitial());

  Future<void> checkinternet() async {
    emit(CheckInternetLoading());
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        // Check if the device is connected to any network
        final List<ConnectivityResult> connectivityResult =
            await Connectivity().checkConnectivity();

        if (connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.ethernet) ||
            connectivityResult.contains(ConnectivityResult.wifi)) {
          //print(connectivityResult.toString());
          try {
            // Perform an actual HTTP request to verify internet access
            final response = await dio.get(
              'https://www.google.com',
              options: Options(
                receiveTimeout: const Duration(seconds: 5), // 5 seconds timeout
                sendTimeout: const Duration(seconds: 5),
              ),
            );
            if (response.statusCode == 200) {
              emit(CheckInternetSuccess());
            } else {
              emit(CheckInternetFailed());
            }
          } catch (e) {
            // Dio throws an error if the request fails
            emit(CheckInternetFailed());
          }
        } else {
          // No network connectivity
          // print(connectivityResult.toString());
          emit(CheckInternetFailed());
        }
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'check_internet_state.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  CheckInternetCubit() : super(CheckInternetInitial());
  Future<void> checkinternet() async {
    emit(CheckInternetLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

// This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)
       // ||connectivityResult.contains(ConnectivityResult.ethernet)
        ) {
      emit(CheckInternetSuccess());
    }else{
      emit(CheckInternetFailed());
    }
  }
}

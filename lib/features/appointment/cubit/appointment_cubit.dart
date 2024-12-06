import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/features/appointment/appointment_repo.dart';
import 'package:vcare/features/appointment/appointment_response.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._appointmentRepo) : super(AppointmentInitial());
  final AppointmentRepo _appointmentRepo;
  Future<void> getallappointments()async{
    emit(AppointmentLoading());
    final resposne = await _appointmentRepo.getappointments();
    resposne.when(success: (data) {
      emit(AppointmentSuccess(appointmentResponse: data));
    }, failure: (errorHandler) {
      emit(AppointmentFailed(message: errorHandler.apiErrorModel.message??'Unknown error occred'));
    },);
  }
}

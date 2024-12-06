import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/features/appointment/appointment_repo.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._appointmentRepo) : super(AppointmentInitial());
  final AppointmentRepo _appointmentRepo;
  Future<void> getallappointments()async{
    final resposne = await _appointmentRepo.getappointments();
    
  }
}

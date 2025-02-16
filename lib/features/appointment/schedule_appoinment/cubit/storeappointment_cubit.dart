import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/features/appointment/schedule_appoinment/models/store_appointment_model.dart';
import 'package:vcare/features/appointment/schedule_appoinment/repo/store_appointment_repo.dart';

part 'storeappointment_state.dart';

class StoreappointmentCubit extends Cubit<StoreappointmentState> {
  StoreappointmentCubit(this.storeAppointmentRepo)
      : super(StoreappointmentInitial());
  final StoreAppointmentRepo storeAppointmentRepo;
  late int doctorId;
  DateTime date = DateTime.now();
  int time = -1;
  String notes = '';
  Future storeappointment() async {
    StoreAppointmentModel storeappointmentmodel =
        StoreAppointmentModel(doctor_id: '', start_time: '', notes: '');
    emit(Storeappointmentloading());
    if (doctorId != null && date != null) {
      final date = DateTime.now();
      storeappointmentmodel.doctor_id = doctorId.toString();
      storeappointmentmodel.notes = notes;
      storeappointmentmodel.start_time =
          '${date.year}-${date.month}-${date.day.toString()} $time:00';
      print(storeappointmentmodel.doctor_id);
      print(storeappointmentmodel.start_time);
      print(storeappointmentmodel.notes);
      final result = await storeAppointmentRepo
          .storeAppointmentRepo(storeappointmentmodel);
      result.when(
        success: (data) {
          print('success api');
          emit(Storeappointmentsuccess());
        },
        failure: (errorHandler) {
          emit(Storeappointmentfailed());
        },
      );
    } else {
      emit(Storeappointmentfailed());
    }
  }
}

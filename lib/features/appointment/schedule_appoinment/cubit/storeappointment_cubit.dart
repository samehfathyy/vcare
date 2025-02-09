import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/features/appointment/schedule_appoinment/models/store_appointment_model.dart';
import 'package:vcare/features/appointment/schedule_appoinment/repo/store_appointment_repo.dart';

part 'storeappointment_state.dart';

class StoreappointmentCubit extends Cubit<StoreappointmentState> {
  StoreappointmentCubit(this.storeAppointmentRepo) : super(StoreappointmentInitial());
  final StoreAppointmentRepo storeAppointmentRepo;
  void storeappointment(StoreAppointmentModel storeappointmentmodel)async{
      emit(Storeappointmentloading());
      
    final result = await storeAppointmentRepo.storeAppointmentRepo(storeappointmentmodel);
    result.when(success: (data) {
      emit(Storeappointmentsuccess());
    }, failure: (errorHandler) {
      emit(Storeappointmentfailed());
    },);
    
  }
}

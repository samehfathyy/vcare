import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/features/appointment/schedule_appoinment/models/store_appointment_model.dart';
import 'package:vcare/features/appointment/schedule_appoinment/models/store_appointment_response.dart';
import 'package:vcare/features/login/models/login_response.dart';

class StoreAppointmentRepo {
    final ApiServices _apiServices;
  StoreAppointmentRepo(this._apiServices);
  Future<ApiResult<StoreAppointmentResponse>> storeAppointmentRepo(StoreAppointmentModel storeappointmentmodel)async{
    try {
      StoreAppointmentResponse response = await _apiServices.storeappointment(storeappointmentmodel);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
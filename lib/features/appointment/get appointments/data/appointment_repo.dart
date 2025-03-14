import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/features/appointment/get%20appointments/data/appointment_response.dart';

class AppointmentRepo {
  final ApiServices _apiServices;
  AppointmentRepo(this._apiServices);
  Future<ApiResult<AppointmentResponse>> getappointments()async{
    try{
    final result = await _apiServices.getallappointments();
    return ApiResult.success(result);

    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
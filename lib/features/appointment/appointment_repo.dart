import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/features/appointment/appointment_response.dart';

class AppointmentRepo {
  final ApiServices _apiServices;
  AppointmentRepo({required ApiServices apiServices}) : _apiServices = apiServices;
  Future<ApiResult<AppointmentResponse>> getappointments()async{
    try{
    final result = await _apiServices.getallappointments();
    return ApiResult.success(result);

    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/core/networking/user_profile_response_model.dart';

class UserProfileRepo {
final ApiServices _apiServices;
  UserProfileRepo(this._apiServices);
   Future<ApiResult<UserProfileResponseModel>> getuserprofile()async{
    try{
    final response= await _apiServices.userprofile();
    return ApiResult.success(response);
    }catch(error){
    return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  
}
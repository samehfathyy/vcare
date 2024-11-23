import 'package:dio/dio.dart';
import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/features/login/models/login_response.dart';
import 'package:vcare/features/signup/models/signup_request_body.dart';
import 'package:vcare/features/signup/models/signup_response.dart';

class SignupRepo {
  final ApiServices _apiServices;
  SignupRepo(this._apiServices);

  Future<ApiResult<SignupResponse>> signupRepo(
      SignupRequestBody signuprequestbody) async {
    try {
      SignupResponse response = await _apiServices.signup(signuprequestbody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  
}
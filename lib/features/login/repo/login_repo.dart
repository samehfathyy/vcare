import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/features/login/models/login_request_body.dart';
import 'package:vcare/features/login/models/login_response.dart';

class LoginRepo {
  final ApiServices _apiServices;
  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> loginrepo(
      LoginRequestBody loginrequestbody) async {
    try {
      LoginResponse response = await _apiServices.login(loginrequestbody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

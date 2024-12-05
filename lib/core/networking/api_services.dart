import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vcare/core/networking/api_paths.dart';
import 'package:vcare/core/networking/user_profile_response_model.dart';
import 'package:vcare/features/login/models/login_request_body.dart';
import 'package:vcare/features/login/models/login_response.dart';
import 'package:vcare/features/signup/models/signup_request_body.dart';
import 'package:vcare/features/signup/models/signup_response.dart';

// Import the generated file
part 'api_services.g.dart';

@RestApi(baseUrl: ApiPaths.baseurl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiPaths.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  
  @POST(ApiPaths.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signuprequestbody,
  );

  @GET(ApiPaths.userprofile)
  Future<UserProfileResponseModel> userprofile(
    
  );

}

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:vcare/core/networking/api_paths.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiPaths.baseurl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
  static const String specializationpath='specialization/index';
  @GET(specializationpath)
  Future<SpecializationModel> getspecializations();
}
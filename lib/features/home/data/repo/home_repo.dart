import 'package:vcare/core/networking/api_error_handler.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/data/api/home_api_service.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);
  
  Future<ApiResult<SpecializationModel>> gethomedata()async{
 try {
      final response = await _homeApiService.getspecializations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/core/networking/dio_factory.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';
import 'package:vcare/features/login/repo/login_repo.dart';

final getIt = GetIt.instance;

void setupgetit() async{
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio),);
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()),);
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()),);
}
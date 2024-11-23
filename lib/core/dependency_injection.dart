import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/core/networking/dio_factory.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';
import 'package:vcare/features/login/repo/login_repo.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';
import 'package:vcare/features/signup/repo/signup_repo.dart';

final getIt = GetIt.instance;

void setupgetit() async {
  //api
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vcare/core/networking/api_services.dart';
import 'package:vcare/core/networking/check%20internet/cubit/check_internet_cubit.dart';
import 'package:vcare/core/networking/dio_factory.dart';
import 'package:vcare/features/appointment/get%20appointments/data/appointment_repo.dart';
import 'package:vcare/features/appointment/get%20appointments/cubit/appointment_cubit.dart';
import 'package:vcare/features/appointment/schedule_appoinment/cubit/storeappointment_cubit.dart';
import 'package:vcare/features/appointment/schedule_appoinment/repo/store_appointment_repo.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/data/api/home_api_service.dart';
import 'package:vcare/features/home/data/repo/home_repo.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';
import 'package:vcare/features/login/repo/login_repo.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';
import 'package:vcare/features/signup/repo/signup_repo.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';
import 'package:vcare/features/user_profile/data/user_profile_repo.dart';

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

  //home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //user profile
  getIt.registerLazySingleton<UserProfileRepo>(() => UserProfileRepo(getIt()));
  getIt.registerFactory<UserprofileCubit>(() => UserprofileCubit(getIt()));
  getIt.registerFactory<CheckInternetCubit>(() => CheckInternetCubit());

  //appointment
  getIt.registerLazySingleton<AppointmentRepo>(() => AppointmentRepo(getIt()));
  getIt.registerFactory<AppointmentCubit>(() => AppointmentCubit(getIt()));
  
  //store appointment
  getIt.registerLazySingleton<StoreAppointmentRepo>(() => StoreAppointmentRepo(getIt()));
  getIt.registerFactory<StoreappointmentCubit>(() => StoreappointmentCubit(getIt()));

}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/core/networking/dio_factory.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  late List<Specializationdata?>? allspecializations;
  int selectedspec = 0;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> getdata() async {
    print('getdata getdata getdata');
    final result = await _homeRepo.gethomedata();
    await DioFactory.setTokenIntoHeaderAfterLogin();
    result.when(
      success: (data) {
        final specializationslist = data.specializationdata;
        allspecializations = specializationslist;
        filterdoctors(0);
        emit(HomeSuccess(specializationslist ?? []));
      },
      failure: (errorHandler) {
        emit(HomeFailed(errormsg: errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }

  void filterdoctors(int index) {
    print('filter filter filter1');
    emit(DoctorsLoading());
    //print(allspecializations!.length.toString());
    try {
      //if (index < allspecializations!.length && index >= 0) {
      List<Doctor?> doctors = allspecializations![index]!.doctors ?? [];
      emit(DoctorsSuccess(doctors));

      print('filter filter filter ${doctors.length}');
      // } else {
      //   emit(DoctorsFailed(errormsg: 'Error occured'));
      // }
    } catch (e) {
      emit(DoctorsFailed(errormsg: 'Error occured'));
    }
  }

  void refreshspecslist() {
    emit(HomeSuccess(allspecializations ?? []));
  }
}

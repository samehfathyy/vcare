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
    ///emit(DoctorsLoading());
    print('loading state');
    emit(HomeLoading());
    final result = await _homeRepo.gethomedata();
    print('result done');
    await DioFactory.setTokenIntoHeaderAfterLogin();
    result.when(
      success: (data) {
        final specializationslist = data.specializationdata;
        final doctors = specializationslist?[selectedspec].doctors ?? [];
        allspecializations = specializationslist;
        emit(HomeSuccess(specializationslist ?? [], doctors));
      },
      failure: (errorHandler) {
        emit(HomeFailed(errormsg: errorHandler.apiErrorModel.message ?? ''));
        print('faiiled emitted');
      },
    );
  }

  void filterdoctors(int index) {
    //print(allspecializations!.length.toString());
    selectedspec = index;
    //if (index < allspecializations!.length && index >= 0) {
    List<Doctor?> doctors = allspecializations![index]!.doctors ?? [];
    emit(HomeSuccess(allspecializations ?? [], doctors));
    // } else {
    //   emit(DoctorsFailed(errormsg: 'Error occured'));
    // }
  }

  void refreshspecslist() {
    emit(HomeSuccess(
        allspecializations ?? [], allspecializations![2]!.doctors ?? []));
  }
}

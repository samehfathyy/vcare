import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vcare/core/networking/user_profile_response_model.dart';
import 'package:vcare/features/user_profile/data/user_profile_repo.dart';

part 'userprofile_state.dart';

class UserprofileCubit extends Cubit<UserprofileState> {
  UserprofileCubit(this._userProfileRepo) : super(UserprofileInitial());
  final UserProfileRepo _userProfileRepo;
  Future<void> getuserprofile() async {
    emit(UserprofileInitial());
    final response = await _userProfileRepo.getuserprofile();
    emit(UserprofileLoading());
    response.when(
      success: (data) {
        String name = data.data!.first!.name!.split(' ')[0];
        emit(UserprofileSuccess(
            userProfileResponseModel: data, userfirstname: name));
      },
      failure: (errorHandler) {
        emit(UserprofileFailed(
            errormsg: errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}

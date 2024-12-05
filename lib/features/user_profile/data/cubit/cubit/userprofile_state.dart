part of 'userprofile_cubit.dart';

@immutable
sealed class UserprofileState {}

final class UserprofileInitial extends UserprofileState {}

final class UserprofileLoading extends UserprofileState {}

final class UserprofileSuccess extends UserprofileState {
  final UserProfileResponseModel userProfileResponseModel;
  final String userfirstname;
  UserprofileSuccess(
      {required this.userfirstname, required this.userProfileResponseModel});
}

final class UserprofileFailed extends UserprofileState {
  final String errormsg;
  UserprofileFailed({required this.errormsg});
}

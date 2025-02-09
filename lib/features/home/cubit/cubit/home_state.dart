part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Specializationdata?> specializationslist;
    final List<Doctor?> doctorlist;
  HomeSuccess(this.specializationslist, this.doctorlist,);
}

final class HomeFailed extends HomeState {
  final String errormsg;

  HomeFailed({required this.errormsg});
}

final class DoctorsLoading extends HomeState {}

final class DoctorsSuccess extends HomeState {
  final List<Doctor?> doctorlist;
  DoctorsSuccess(this.doctorlist,);
}

final class DoctorsFailed extends HomeState {
  final String errormsg;
  DoctorsFailed({required this.errormsg});
}


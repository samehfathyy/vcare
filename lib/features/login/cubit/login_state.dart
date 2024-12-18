part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccess({required this.loginResponse});
}

final class LoginFailed extends LoginState {
  final String errormsg;
  LoginFailed({required this.errormsg});
}

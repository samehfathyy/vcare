part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class Signuploading extends SignupState {}
final class Signupsuccess extends SignupState {
  final SignupResponse signupResponse;
  Signupsuccess({required this.signupResponse});
}
final class Signupfailed extends SignupState {
  final String errormsg;
  Signupfailed({required this.errormsg});
}

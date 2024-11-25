import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vcare/features/login/models/login_request_body.dart';
import 'package:vcare/features/login/models/login_response.dart';
import 'package:vcare/features/login/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  TextEditingController emialtextcontroller = TextEditingController();
  TextEditingController passwordtextcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoading());
    final loginrequestbody = LoginRequestBody(
        email: emialtextcontroller.text, password: passwordtextcontroller.text);
    final response = await _loginRepo.loginrepo(loginrequestbody);
    response.when(success: (LoginResponse) {
      emit(LoginSuccess(loginResponse: LoginResponse));
    }, failure: (error) {
      emit(LoginFailed(errormsg: error.apiErrorModel.message ?? ''));
    });
  }
}

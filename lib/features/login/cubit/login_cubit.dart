import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vcare/core/helper/shared_pref_helper.dart';
import 'package:vcare/core/networking/dio_factory.dart';
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
  bool rememberme = true;

  Future<void> login() async {
    emit(LoginInitial());
    emit(LoginLoading());
    final loginrequestbody = LoginRequestBody(
        email: emialtextcontroller.text, password: passwordtextcontroller.text);
    final response = await _loginRepo.loginrepo(loginrequestbody);
    response.when(success: (loginresponse) async {
        await SharedPrefHelper.setSecuredString(
            SharedPrefHelper.userToken, loginresponse.data.token);
      await DioFactory.setTokenIntoHeaderAfterLogin();
      if (rememberme) {
        await SharedPrefHelper.setData(SharedPrefHelper.loggedIn, true);
      }else{
      await SharedPrefHelper.clearAllSecuredData();
      }
      emit(LoginSuccess(loginResponse: loginresponse));
    }, failure: (error) {
      emit(LoginFailed(errormsg: error.apiErrorModel.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    emialtextcontroller.dispose();
    passwordtextcontroller.dispose();
    return super.close();
  }
}

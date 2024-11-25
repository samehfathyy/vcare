import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vcare/core/networking/api_result.dart';
import 'package:vcare/features/signup/models/signup_request_body.dart';
import 'package:vcare/features/signup/models/signup_response.dart';
import 'package:vcare/features/signup/repo/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());
  final SignupRepo signupRepo;
  TextEditingController firstnametextcontroller = TextEditingController();
  TextEditingController lastnametextcontroller = TextEditingController();
  TextEditingController emialtextcontroller = TextEditingController();
  TextEditingController phonetextcontroller = TextEditingController();
  TextEditingController passwordtextcontroller = TextEditingController();
  TextEditingController passwordconfirmationtextcontroller =
      TextEditingController();
  TextEditingController gendertextcontroller = TextEditingController();
  final personalinfoformKey = GlobalKey<FormState>();
  final accountinfoformKey = GlobalKey<FormState>();
  final PageController pageController = PageController();
  int currentscreenindex = 0;
  void nextpage() {
    currentscreenindex = 1;
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(state);
  }

  void previouspage() {
    currentscreenindex = 0;
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(state);
  }

  Future<void> signup() async {
    //emit(SignupInitial());
    emit(Signuploading());
    int gender = 1;
    String name =
        "${firstnametextcontroller.text} ${lastnametextcontroller.text}";
    final SignupRequestBody signupRequestBody = SignupRequestBody(
        name: firstnametextcontroller.text,
        email: emialtextcontroller.text,
        phone: phonetextcontroller.text,
        password: passwordtextcontroller.text,
        passwordConfirmation: passwordconfirmationtextcontroller.text,
        gender: gender);
    try {
      ApiResult response = await signupRepo.signupRepo(signupRequestBody);
      response.when(
        success: (data) {
          emit(Signupsuccess(signupResponse: data));
        },
        failure: (errormsg) {
          emit(Signupfailed(errormsg: errormsg.apiErrorModel.message ?? ''));
        },
      );
    } catch (e) {
      emit(Signupfailed(errormsg: e.toString()));
    }
  }
}

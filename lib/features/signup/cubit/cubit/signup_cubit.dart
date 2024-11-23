import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vcare/core/networking/api_error_handler.dart';
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
  final formKey = GlobalKey<FormState>();
   final PageController pageController=PageController();

   void nextpage(){
    pageController.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
   }
   void previouspage(){
    pageController.animateToPage(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
   }

  Future<void> singup() async {
    emit(SignupInitial());
    int gender = int.parse(gendertextcontroller.text);
    String name="${firstnametextcontroller.text} ${lastnametextcontroller.text}";
    final SignupRequestBody signupRequestBody = SignupRequestBody(
        name: name,
        email: emialtextcontroller.text,
        phone: phonetextcontroller.text,
        password: passwordtextcontroller.text,
        passwordConfirmation: passwordconfirmationtextcontroller.text,
        gender: gender);
      ApiResult response = await signupRepo.signupRepo(signupRequestBody);
      response.when(success: (data) {
              emit(Signupsuccess(signupResponse: data));
      }, failure: (errormsg) {
        emit(Signupfailed(errormsg: errormsg.apiErrorModel.message ?? ''));
      },);
  }
}

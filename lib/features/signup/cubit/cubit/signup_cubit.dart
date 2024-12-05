import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vcare/core/helper/shared_pref_helper.dart';
import 'package:vcare/core/networking/dio_factory.dart';
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
  final FocusNode emailfieldfocusnode = FocusNode();
  final PageController pageController = PageController();
  int currentscreenindex = 0;

  void nextpage() {
    currentscreenindex = 1;
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(SignupInitial());
  }

  void previouspage() {
    currentscreenindex = 0;
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(SignupInitial());
  }

  Future<void> signup() async {
    //emit(SignupInitial());
    emit(Signuploading());
    int gender = 1;
    String name =
        "${firstnametextcontroller.text} ${lastnametextcontroller.text}";
    final SignupRequestBody signupRequestBody = SignupRequestBody(
        name: name,
        email: emialtextcontroller.text,
        phone: phonetextcontroller.text,
        password: passwordtextcontroller.text,
        passwordConfirmation: passwordconfirmationtextcontroller.text,
        gender: gender);

    final response = await signupRepo.signupRepo(signupRequestBody);
    response.when(
      success: (signupresponse) async{
        await SharedPrefHelper.setSecuredString(
            SharedPrefHelper.userToken, signupresponse.data.token);
        await SharedPrefHelper.setData(SharedPrefHelper.loggedIn, true);
        await DioFactory.setTokenIntoHeaderAfterLogin();
        emit(Signupsuccess(signupResponse: signupresponse));
      },
      failure: (errormsg) {
        emit(Signupfailed(errormsg: errormsg.apiErrorModel.message ?? ''));
      },
    );
  }

  @override
  Future<void> close() {
    // Dispose of all the controllers
    firstnametextcontroller.dispose();
    lastnametextcontroller.dispose();
    emialtextcontroller.dispose();
    phonetextcontroller.dispose();
    passwordtextcontroller.dispose();
    passwordconfirmationtextcontroller.dispose();
    gendertextcontroller.dispose();
    pageController.dispose();

    return super.close();
  }
}

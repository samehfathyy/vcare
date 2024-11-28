import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/constants.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/login/screens/login_screen.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';
import 'package:vcare/features/signup/widgets/account_form.dart';
import 'package:vcare/features/signup/widgets/personal_details_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: Constants.horizontalpadding,
                  right: Constants.horizontalpadding,
                  bottom: Constants.horizontalpadding),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller:
                              context.read<SignupCubit>().pageController,
                          children: const [
                            SingleChildScrollView(child: PersonalDetailsForm()),
                            SingleChildScrollView(child: AccountForm()),
                          ],
                        );
                      },
                    ),
                  ),
                  BlocListener<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is Signuploading) {
                        appDialog(
                          context: context,
                          title: 'Signing up...',
                          alertdialog: false,
                          icon: null,
                        );
                      } else if (state is Signupsuccess) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).pop();
                          appDialog(
                            context: context,
                            title: 'Error occurred',
                            alertdialog: true,
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 50.w,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        });
                      } else if (state is Signupfailed) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context)
                              .pop(); // Close the loading dialog if it's open
                          appDialog(
                            context: context,
                            title: 'Error occurred',
                            alertdialog: true,
                            icon: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 50.w,
                            ),
                          );
                        });
                      }
                    },
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          height: Constants.buttonsheight,
                          child: Row(
                            children: [
                              //back button
                              SizedBox(
                                width: Constants.buttonsheight,
                                height: Constants.buttonsheight,
                                child: IconButton(
                                  onPressed: () {
                                    if (context
                                            .read<SignupCubit>()
                                            .currentscreenindex ==
                                        0) {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ));
                                    } else {
                                      context
                                          .read<SignupCubit>()
                                          .previouspage();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: AppColors.white,
                                    size: 30,
                                  ),
                                  padding: EdgeInsets.all(0),
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: Constants.buttonsheight,
                                  child: TextButton(
                                    onPressed: () async {
                                      if (context
                                                  .read<SignupCubit>()
                                                  .currentscreenindex ==
                                              0 &&
                                          context
                                              .read<SignupCubit>()
                                              .personalinfoformKey
                                              .currentState!
                                              .validate()) {
                                        context.read<SignupCubit>().nextpage();
                                      } else if (context
                                                  .read<SignupCubit>()
                                                  .currentscreenindex ==
                                              1 &&
                                          context
                                              .read<SignupCubit>()
                                              .accountinfoformKey
                                              .currentState!
                                              .validate()) {
                                        await context
                                            .read<SignupCubit>()
                                            .signup();
                                      }
                                    },
                                    child: Text(
                                      context
                                                  .read<SignupCubit>()
                                                  .currentscreenindex ==
                                              0
                                          ? 'Next'
                                          : 'Sign up',
                                      style: TextStyles.font16light,
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColors.mainpurple,
                                      //padding: EdgeInsets.symmetric(vertical: 12.h),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}


/*
BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                    if (context.read<SignupCubit>().currentscreenindex == 0) {
                      return Row(
                        children: [
                          SizedBox(
                            width: Constants.buttonsheight,
                            height: Constants.buttonsheight,
                            child: TextButton(
                                onPressed: () {},
                                child: Icon(Icons.keyboard_arrow_left)),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: Constants.buttonsheight,
                            child: TextButton(
                              onPressed: () {
                                if (context
                                    .read<SignupCubit>()
                                    .personalinfoformKey
                                    .currentState!
                                    .validate()) {
                                  context.read<SignupCubit>().nextpage();
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.mainpurple,
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Next',
                                    style: TextStyles.font16light,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColors.white,
                                    size: 26.h,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return SizedBox(
                        width: double.infinity,
                        height: 45.h,
                        child: TextButton(
                          onPressed: () async {
                            if (context
                                .read<SignupCubit>()
                                .accountinfoformKey
                                .currentState!
                                .validate()) {
                              context.read<SignupCubit>().signup();
                              if (state is Signuploading) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.mainpurple,
                                    ),
                                  ),
                                );
                              }

                              if (state is Signupsuccess) {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // Prevent dismissing manually
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 50.0,
                                          ),
                                          const SizedBox(height: 16.0),
                                          Text(
                                            'Account Registered Successfully!',
                                            style: TextStyles.font16dark,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Home(),
                                    ),
                                  );
                                });
                              }
                              if (state is Signupfailed) {
                                Navigator.of(context).pop();
                                await showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // Prevent dismissing manually
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 50.0,
                                          ),
                                          const SizedBox(height: 16.0),
                                          Text(
                                            state.errormsg,
                                            style: TextStyles.font16dark,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.of(context).pop();
                                  //context.read<SignupCubit>().previouspage();
                                });
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.mainpurple,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyles.font16light,
                          ),
                        ),
                      );
                    }
                  })
              */

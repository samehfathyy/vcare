import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';

class SigninButton extends StatefulWidget {
  const SigninButton({super.key});

  @override
  State<SigninButton> createState() => _SigninButtonState();
}

class _SigninButtonState extends State<SigninButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        appDialog(
                          context: context,
                          title: 'Signing in...',
                          alertdialog: false,
                          icon: null,
                        );
                      } else if (state is LoginSuccess) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        });
                      } else if (state is LoginFailed) {
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
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: Appsizes.buttonsheight,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              if (context
                                  .read<LoginCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                context.read<LoginCubit>().login();
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.mainpurple,
                              //padding: EdgeInsets.symmetric(vertical: 12.h),
                            ),
                            child: Text(
                              'Sign in',
                              style: TextStyles.font16light,
                            ),
                          ),
                        );
                      },
                    ),
                  );
  }
}
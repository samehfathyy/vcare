import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/constants.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';
import 'package:vcare/features/login/widgets/email_and_password.dart';
import 'package:vcare/features/signup/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: EdgeInsets.only(
              bottom: Constants.horizontalpadding,
              left: Constants.horizontalpadding,
              right: Constants.horizontalpadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Image.asset('assets/images/docdoc_logo_low_opacity.png'),
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Text(
                            'welcome back!',
                            style: TextStyles.font22dark,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Text(
                            'We\'re excited to have you back.',
                            style:
                                TextStyles.font16dark.copyWith(fontSize: 13.sp),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        const EmailAndPassword(),
                        SizedBox(
                          height: 15.h,
                        ),
                        registerbutton(context),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginInitial) {
                      return InitialButton(
                        width: MediaQuery.of(context).size.width,
                      );
                    }
                    if (state is LoginLoading) {
                      return Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50.h,
                              height: 50.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.mainpurple),
                            ),
                            SizedBox(
                                height: 30.h,
                                width: 30.h,
                                child: const CircularProgressIndicator(
                                  color: AppColors.white,
                                )),
                          ],
                        ),
                      );
                    }
                    if (state is LoginSuccess) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                    }
                    if (state is LoginFailed) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Prevent closing by tapping outside
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        state.errormsg,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      const SizedBox(height: 20.0),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                          // Optionally, trigger any retry logic here
                                          // await context
                                          //     .read<LoginCubit>()
                                          //     .login();
                                        },
                                        child: const Text('Retry'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                      return InitialButton(
                        width: MediaQuery.of(context).size.width,
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget initialbutton(BuildContext context) {
//   double width = double.infinity;
//   return AnimatedContainer(
//     duration: Duration(milliseconds: 300),
//     width: width, height: 50.h,
//     //sign in button
//     child: TextButton(
//       onPressed: () async {
//         width = 50.h;
//         if (context.read<LoginCubit>().formKey.currentState!.validate()) {
//           context.read<LoginCubit>().login();
//         }
//       },
//       style: TextButton.styleFrom(
//         backgroundColor: AppColors.mainpurple,
//         padding: EdgeInsets.symmetric(vertical: 12.h),
//       ),
//       child: Text(
//         'Sign in',
//         style: TextStyles.font16light,
//       ),
//     ),
//   );
// }

//context.read<LoginCubit>().

Widget registerbutton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Don\'t have an account?',
        style: TextStyle(fontSize: 13.sp),
      ),
      TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(8.w)),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              ));
        },
        child: Text('resgister now',
            style: TextStyle(fontSize: 13.sp, color: AppColors.mainpurple)),
      ),
    ],
  );
}

class InitialButton extends StatefulWidget {
  InitialButton({super.key, required this.width});
  double width;

  @override
  State<InitialButton> createState() => _InitialButtonState();
}

class _InitialButtonState extends State<InitialButton> {
  bool isShrinking = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: widget.width,
        height: Constants.buttonsheight,
        child: TextButton(
          onPressed: () async {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              if (!isShrinking) {
                setState(() {
                  widget.width = Constants.buttonsheight;
                  isShrinking = true; // Mark animation as in-progress
                });
                //await Future.delayed(const Duration(milliseconds: 300));
                context.read<LoginCubit>().login();
              } else {
                //Reset the button if validation fails
                setState(() {
                  widget.width = MediaQuery.of(context).size.width;
                  isShrinking = false;
                });
              }
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.mainpurple,
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text(
            widget.width > Constants.buttonsheight ? 'Sign in' : '',
            style: TextStyles.font16light,
          ),
        ),
      ),
    );
  }
}

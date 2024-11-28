import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/constants.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
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
            child: CustomScrollView(
              slivers: [
                //Image.asset('assets/images/docdoc_logo_low_opacity.png'),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/docdoc_logo.svg',
                        width: 70.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Let\'s sign you in!',
                            style: TextStyles.font22dark,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'We\'re excited to have you back.',
                            style:
                                TextStyles.font16dark.copyWith(fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25.h,
                  ),
                ),
                SliverToBoxAdapter(child: EmailAndPassword()),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30.h,
                  ),
                ),
                //sign in button
                SliverToBoxAdapter(
                  child: BlocListener<LoginCubit, LoginState>(
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
                          appDialog(
                            context: context,
                            title: 'done',
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
                          height: Constants.buttonsheight,
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
                            child: state is LoginLoading
                                ? const CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    'Sign in',
                                    style: TextStyles.font16light,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15.h,
                  ),
                ),
                SliverToBoxAdapter(child: registerbutton(context)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    //trying to hide the TermsAndConditionsText while keyboard is on screen
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      TermsAndConditionsText(),
                    ],
                  ),
                )
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
        style: TextStyles.font13dark,
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
            style: TextStyles.font13dark.copyWith(color: AppColors.mainpurple)),
      ),
    ],
  );
}

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font13dark,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.font13dark.copyWith(color: AppColors.mainpurple),
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font13dark.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyles.font13dark.copyWith(color: AppColors.mainpurple),
          ),
        ],
      ),
    );
  }
}

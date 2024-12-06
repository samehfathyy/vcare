import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';
import 'package:vcare/features/login/widgets/email_and_password.dart';
import 'package:vcare/features/login/widgets/logo_and_title.dart';
import 'package:vcare/features/login/widgets/remember_me.dart';
import 'package:vcare/features/login/widgets/signin_button.dart';
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
              bottom: Appsizes.horizontalpadding,
              left: Appsizes.horizontalpadding,
              right: Appsizes.horizontalpadding,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 60.h,
                  ),
                ),
                const SliverToBoxAdapter(child: LogoAndTitle()),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25.h,
                  ),
                ),
                const SliverToBoxAdapter(child: EmailAndPassword()),
                const SliverToBoxAdapter(
                  child: RememberMe(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30.h,
                  ),
                ),
                //sign in button
                const SliverToBoxAdapter(
                  child: SigninButton(),
                ),

                //space
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12.h,
                  ),
                ),

                SliverToBoxAdapter(child: registerbutton(context)),

                //space
                SliverToBoxAdapter(
                  child: SizedBox(
                    //trying to hide the TermsAndConditionsText while keyboard is on screen
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                ),

                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const TermsAndConditionsText(),
                      SizedBox(
                        height: 5.h,
                      ),
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
        style: TextStyles.font13darkgray,
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
            style: TextStyles.font13darkgray
                .copyWith(color: AppColors.mainpurple)),
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
            style: TextStyles.font13darkgray,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style:
                TextStyles.font13darkgray.copyWith(color: AppColors.mainpurple),
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font13darkgray.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style:
                TextStyles.font13darkgray.copyWith(color: AppColors.mainpurple),
          ),
        ],
      ),
    );
  }
}

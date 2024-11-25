import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/helper/app_regex.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/widgets/textformfield.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<SignupCubit>().accountinfoformKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Account Information',
              style: TextStyles.font22dark,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextFormField(
              hintText: 'Email',
              validator: (value) {
                if (value == null || !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email address';
                }
              },
              controller: context.read<SignupCubit>().emialtextcontroller,
              backgroundColor: AppColors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextFormField(
              hintText: 'Password',
              validator: (p) {
                if (p == null || !AppRegex.isPasswordValid(p)) {
                  return 'Please enter a valid password';
                }
              },
              controller: context.read<SignupCubit>().passwordtextcontroller,
              backgroundColor: AppColors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextFormField(
              hintText: 'Password Confirmation',
              validator: (value) {
                if (context.read<SignupCubit>().passwordtextcontroller.text !=
                    value) {
                  return 'Both passwords should match.';
                }
              },
              controller: context
                  .read<SignupCubit>()
                  .passwordconfirmationtextcontroller,
              backgroundColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}

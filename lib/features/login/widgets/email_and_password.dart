import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/helper/app_regex.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/widgets/textformfield.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'email',
            validator: (value) {
              if (value == null || !AppRegex.isEmailValid(value)) {
                return 'not valid email';
              }
            },
            controller: context.read<LoginCubit>().emialtextcontroller,
            backgroundColor: AppColors.white,
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextFormField(
            hintText: 'password',
            validator: (p) {
              if (p == null || !AppRegex.isPasswordValid(p)) {
                return 'not valid';
              }
            },
            controller: context.read<LoginCubit>().passwordtextcontroller,
            backgroundColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}

bool isvalidpassword(String p) {
  if (AppRegex.isPasswordValid(p)) {
    return true;
  }
  return false;
}

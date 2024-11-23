import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/helper/app_regex.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/widgets/textformfield.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          AppTextFormField(
            hintText: 'First Name',
            validator: (value) {
              if (value == null || !AppRegex.isEmailValid(value)) {
                return 'not valid email';
              }
            },
            controller: context.read<SignupCubit>().emialtextcontroller,
            backgroundColor: AppColors.white,
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextFormField(
            hintText: 'Last Name',
            validator: (p) {
              if (p == null || !AppRegex.isPasswordValid(p)) {
                return 'not valid';
              }
            },
            controller: context.read<SignupCubit>().passwordtextcontroller,
            backgroundColor: AppColors.white,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  context.read<SignupCubit>().nextpage();
                },
                child: Text('next')),
          )
        ],
      ),
    );
  }
}

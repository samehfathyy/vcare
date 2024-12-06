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
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: context.read<SignupCubit>().personalinfoformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextFormField(
                hintText: 'First Name',
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return 'Please enter a valid name';
                  }
                },
                controller: context.read<SignupCubit>().firstnametextcontroller,
                backgroundColor: AppColors.white,
                autofocus: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              AppTextFormField(
                hintText: 'Last Name',
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return 'Please enter a valid name';
                  }
                },
                controller: context.read<SignupCubit>().lastnametextcontroller,
                backgroundColor: AppColors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              AppTextFormField(
                hintText: 'Phone Number',
                preFixIcon: SizedBox(
                  width: 60.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 13.w,
                      ),
                      Icon(
                        Icons.phone_iphone,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 1.w,
                        height: 40.h,
                        color: AppColors.darkgray,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
                textInputType: TextInputType.number,
                validator: (p) {
                  if (p == null || !AppRegex.isPhoneNumberValid(p)) {
                    return 'Please enter a valid Phone Number';
                  }
                },
                controller: context.read<SignupCubit>().phonetextcontroller,
                backgroundColor: AppColors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

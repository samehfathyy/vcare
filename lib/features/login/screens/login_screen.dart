import 'package:flutter/material.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/widgets/textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextFormField(
                hintText: 'email',
                validator: (p0) {},
              ),
              SizedBox(
                height: 10.h,
              ),
              AppTextFormField(
                hintText: 'password',
                validator: (p0) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

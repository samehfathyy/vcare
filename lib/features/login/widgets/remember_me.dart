import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        SizedBox(
          width: 30.w,
          child: Checkbox(
            value: context.read<LoginCubit>().rememberme,
            checkColor: AppColors.white,
            activeColor: AppColors.mainpurple,
            onChanged: (value) {
              context.read<LoginCubit>().rememberme = value ?? true;
              setState(() {});
            },
            //shape: CircleBorder(),
          ),
        ),
        Text('Remember me',
            style:
                TextStyles.font13darkgray //.copyWith(color: AppColors.black),
            ),
      ],
    );
  }
}

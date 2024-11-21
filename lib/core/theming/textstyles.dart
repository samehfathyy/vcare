import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';

class TextStyles {
  static TextStyle font14light = TextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
  );
  static TextStyle font16dark = TextStyle(
      fontSize: 16.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);
  static TextStyle font26dark = TextStyle(
      fontSize: 26.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);
}

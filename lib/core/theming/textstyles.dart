import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';

class TextStyles {
  static TextStyle textformfont = TextStyle(
    fontSize: 16.sp, color: AppColors.black, fontWeight: FontWeight.normal,
    //fontFamily: 'Poppins',
  );
  static TextStyle font16light = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontFamily: 'Poppins',
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
  static TextStyle font26light = TextStyle(
      fontSize: 26.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700);
}

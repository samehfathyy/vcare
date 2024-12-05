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

  static TextStyle font18dark = TextStyle(
      fontSize: 18.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);

  static TextStyle font22dark = TextStyle(
      fontSize: 22.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);

  static TextStyle font21dark = TextStyle(
      fontSize: 21.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);

  static TextStyle font22light = TextStyle(
      fontSize: 22.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700);

  static TextStyle font13darkgray = TextStyle(
      fontSize: 13.sp,
      color: AppColors.darkgray,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400);
  static TextStyle font13dark = TextStyle(
      fontSize: 13.sp,
      color: AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400);
  static TextStyle font14dark = TextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
}

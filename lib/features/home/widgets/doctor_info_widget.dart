import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';

class DoctorInfoWidget extends StatelessWidget {
  const DoctorInfoWidget(
      {super.key,
      required this.icon,
      required this.header,
      required this.info});
  final IconData icon;
  final String header;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        // width: 100,
        //height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 45.sp,
                  color: AppColors.lightgray,
                ),
                Icon(
                  icon,
                  size: 27.sp,
                  color: AppColors.mainpurple,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              header,
              style: TextStyles.font13darkgray,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              info,
              style: TextStyles.font16dark,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

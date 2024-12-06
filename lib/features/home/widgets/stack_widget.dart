import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
        height: 190.h,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.only(left: 18.w, top: 12.h, bottom: 12.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  //color: AppColors.mainpurple,
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage('assets/images/home_blue_pattern.png'))),
              height: 160.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Book and\nschedule with\nnearest doctor',
                    style: TextStyles.font22dark
                        .copyWith(height: 1.1.h, color: AppColors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20.w)),
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font13darkgray.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/doctor.png',
                //width: 160.h,
                height: 200.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

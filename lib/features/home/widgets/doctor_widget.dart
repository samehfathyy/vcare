import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/screens/detailed_doctor_screen.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key, required this.doctor});
  final Doctor doctor;
  String formatTime(String time) {
    return time.replaceFirst(RegExp(r':\d{2} '), ' ');
  }

  @override
  Widget build(BuildContext context) {
    bool female = doctor.gender.contains('f');
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 15.h, right: 15.h),
      child: IntrinsicHeight(
        child: Container(
          //height: 250,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          decoration: BoxDecoration(
              color: AppColors.white, ////////////////
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    !female
                        ? 'assets/images/male_doctor.png'
                        : 'assets/images/female_doctor.png',
                    width: 60.w,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. ${doctor.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font16dark,
                        ),
                        Text(
                          '${doctor.degree} - ${doctor.specialization!.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font13dark,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightgray,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicHeight(
                        child: SizedBox(
                          //height: 60,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 8.w, left: 12.w, right: 12.w, top: 2.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${doctor.price.toString()} EGP',
                                      style: TextStyles.font14dark,
                                    ),
                                    Text(
                                      'Consultation Fees',
                                      style: TextStyles.font13dark
                                          .copyWith(color: AppColors.darkgray2),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: AppColors.black,
                                  thickness: 1 / 2,
                                  width: 20,
                                  indent: 3.h,
                                  endIndent: 3.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '4.8',
                                      style: TextStyles.font14dark,
                                    ),
                                    Text(
                                      'Rating',
                                      style: TextStyles.font13dark
                                          .copyWith(color: AppColors.darkgray2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //button
                      SizedBox(
                        width: double.infinity,
                        height: Appsizes.buttonsheight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailedDoctorScreen(
                                  doctor: doctor,
                                  female: female,
                                );
                              },
                            ));
                            // Navigator.of(context).push(
                            //   PageRouteBuilder(
                            //     transitionDuration: Duration(
                            //         milliseconds: 400), // Animation duration
                            //     pageBuilder:
                            //         (context, animation, secondaryAnimation) {
                            //       return DetailedDoctorScreen(
                            //         doctor: doctor,
                            //         female: female,
                            //       );
                            //     },
                            //     transitionsBuilder: (context, animation,
                            //         secondaryAnimation, child) {
                            //       return SlideTransition(
                            //         position: Tween<Offset>(
                            //           begin: Offset(1, 0), // Start from bottom
                            //           end: Offset(
                            //               0, 0), // Move to normal position
                            //         ).animate(animation),
                            // child: child,
                            // );
                            // },
                            // ),
                            // );
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.mainblue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Book Appointment',
                                style: TextStyles.font16light,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class doctorwidgetshimmer extends StatefulWidget {
  const doctorwidgetshimmer({super.key});

  @override
  State<doctorwidgetshimmer> createState() => _doctorwidgetshimmerState();
}

class _doctorwidgetshimmerState extends State<doctorwidgetshimmer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 15.h, right: 15.h),
      child: Shimmer.fromColors(
        baseColor: AppColors.gray,
        highlightColor: AppColors.lightgray,
        child: Container(
          height: 140.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.sp),
          ),
        ),
      ),
    );
  }
}

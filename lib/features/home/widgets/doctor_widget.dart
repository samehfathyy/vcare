import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcare/core/start_app.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';

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
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14.sp),
        child: Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppColors.white,////////////////
              borderRadius: BorderRadius.circular(14.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                !female
                    ? 'assets/images/male_doctor.png'
                    : 'assets/images/female_doctor.png',
                width: 80.w,
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
                    //time
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 15.sp,
                          color: AppColors.darkgray,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '${formatTime(doctor.start_time)} - ${formatTime(doctor.end_time)}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font13darkgray,
                        )
                      ],
                    )
                  ],
                ),
              ),
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
          height: 100.h,
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

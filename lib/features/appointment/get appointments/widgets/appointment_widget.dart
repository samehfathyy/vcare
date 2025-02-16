import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/appointment/get%20appointments/data/appointment_response.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({super.key, required this.appointment});
  final Appointment appointment;

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    bool female = widget.appointment.doctor.gender.contains('f');
    // Define the format matching the API date
    DateFormat format = DateFormat("EEEE, MMMM d, y h:mm a");
    // Parse the date string
    DateTime parsedDate = format.parse(widget.appointment.appointmentTime);
    String monthName = DateFormat('MMMM').format(parsedDate); // Full month name
    String dayName = DateFormat('EEEE').format(parsedDate); // Full day name
    bool olddate = DateTime.now().isAfter(parsedDate);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 15.h, right: 15.h),
      child: Container(
          height: 180.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppColors.white, ////////////////
              borderRadius: BorderRadius.circular(14.sp)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DR. ${widget.appointment.doctor.name}',
                        style: TextStyles.font18dark,
                      ),
                      Text(
                        widget.appointment.doctor.specialization.name,
                        style: TextStyles.font13darkgray,
                      ),
                    ],
                  ),
                  Image.asset(
                    !female
                        ? 'assets/images/male_doctor.png'
                        : 'assets/images/female_doctor.png',
                    width: 40.w,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.lightgray,
                          borderRadius: BorderRadius.circular(8.sp)),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                            size: 20,
                            color: AppColors.mainblue,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '${parsedDate.hour}:${parsedDate.minute}${parsedDate.minute < 9 ? '0' : ''}',
                            style: TextStyles.font14dark
                                .copyWith(color: AppColors.mainblue),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          const Icon(
                            Icons.date_range,
                            size: 20,
                            color: AppColors.mainblue,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '$dayName, $monthName ${parsedDate.day}',
                            style: TextStyles.font14dark
                                .copyWith(color: AppColors.mainblue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.w, vertical: 5.h),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: AppColors.darkgray, // Border color
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Adjust the radius as needed
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style:
                            TextStyles.font14dark.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w, left: 15.w),
                    child: Text(
                      widget.appointment.status,
                      style: TextStyles.font13darkgray,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

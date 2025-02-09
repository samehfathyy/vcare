import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/appointment/schedule_appoinment/widgets/Avalaible_time.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/widgets/doctor_info_widget.dart';

class DetailedDoctorScreen extends StatelessWidget {
  const DetailedDoctorScreen(
      {super.key, required this.doctor, required this.female});
  final Doctor doctor;
  final bool female;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgray,
      appBar: AppBar(
        backgroundColor: AppColors.lightgray,
        // title: Hero(tag: doctor, child: Text(doctor.name)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Hero(
                    tag: doctor.photo,
                    child: Image.asset(
                      !female
                          ? 'assets/images/male_doctor.png'
                          : 'assets/images/female_doctor.png',
                      width: 100.w,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Hero(
                        tag: doctor.name,
                        child: Text(
                          'Dr. ${doctor.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font21dark,
                        ),
                      ),
                      Text(
                        '${doctor.degree} - ${doctor.specialization!.name}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyles.font13dark,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DoctorInfoWidget(
                      icon: Icons.attach_money,
                      header: 'Fees',
                      info: doctor.price.toString()),
                  SizedBox(
                    width: 15.w,
                  ),
                  const DoctorInfoWidget(
                      icon: Icons.star, header: 'Rating', info: '4.8'),
                  SizedBox(
                    width: 15.w,
                  ),
                  const DoctorInfoWidget(
                      icon: Icons.access_time_filled,
                      header: 'Experiences',
                      info: '10 years'),
                ],
              ),
              SizedBox(
                height: 15.w,
              ),
              Row(
                children: [
                  Text(
                    'Avalaible Time',
                    style: TextStyles.font18dark,
                  ),
                ],
              ),
              SizedBox(
                height: 15.w,
              ),
              AvalaibleTime(),
              SizedBox(
                height: 15.w,
              ),

              SizedBox(
                height: Appsizes.buttonsheight,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.mainpurple,
                    //padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    'Book Appointment',
                    style: TextStyles.font16light,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
              // Text(doctor.city?.name ?? ''),
              // Text(doctor.city?.governrate?.name ?? ''),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(doctor.start_time),
              // Text(doctor.end_time),
              // Text(doctor.price.toString()),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.white,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.call),
      // ),
    );
  }
}

String getMonthName(int monthNumber) {
  const List<String> months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];

  if (monthNumber < 1 || monthNumber > 12) {
    return "INVALID"; // Handle out-of-range values
  }

  return months[monthNumber - 1]; // Adjust for zero-based index
}

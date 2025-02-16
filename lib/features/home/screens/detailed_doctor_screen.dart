import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/appointment/schedule_appoinment/cubit/storeappointment_cubit.dart';
import 'package:vcare/features/appointment/schedule_appoinment/widgets/Avalaible_time.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/widgets/book_appointment_button.dart';
import 'package:vcare/features/home/widgets/doctor_info_widget.dart';

class DetailedDoctorScreen extends StatelessWidget {
  const DetailedDoctorScreen(
      {super.key, required this.doctor, required this.female});
  final Doctor doctor;
  final bool female;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoreappointmentCubit>()..doctorId = doctor.id,
      child: Scaffold(
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
                        Text(
                          'Dr. ${doctor.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font21dark,
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
                BookAppointmentButton(docLocation: doctor.city?.name ?? ''),
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
      ),
    );
  }
}

String getMonthName(int monthNumber) {
  const List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  if (monthNumber < 1 || monthNumber > 12) {
    return "INVALID"; // Handle out-of-range values
  }

  return months[monthNumber - 1]; // Adjust for zero-based index
}

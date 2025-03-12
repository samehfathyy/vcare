import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/widgets/doctor_widget.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key, required this.spec});
  final Specializationdata spec;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgray,
      appBar: AppBar(
        backgroundColor: AppColors.lightgray,
        centerTitle: true,
        toolbarHeight: 50.h,
        title: Text(
          spec?.name ?? '',
          style: TextStyles.font18dark,
        ),
      ),
      body: ListView.builder(
        itemCount: spec.doctors?.length,
        itemBuilder: (context, index) {
          return DoctorWidget(doctor: spec.doctors![index]!);
        },
      ),
    );
  }
}

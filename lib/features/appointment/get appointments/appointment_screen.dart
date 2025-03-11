import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/appointment/get%20appointments/cubit/appointment_cubit.dart';
import 'package:vcare/features/appointment/get%20appointments/widgets/appointment_widget.dart';

Widget spacer() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.h),
    color: AppColors.gray,
    width: double.infinity,
    height: 0.5.h,
  );
}

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgray,
      appBar: AppBar(
        title: Text(
          'Your next appointments',
          style: TextStyles.font18dark,
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
            create: (context) =>
                getIt<AppointmentCubit>()..getallappointments(),
            child: BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                // if (state is AppointmentLoading) {
                //   // return const SliverToBoxAdapter(
                //   //   child: Center(
                //   //     child: Padding(
                //   //       padding: EdgeInsets.all(16.0),
                //   //       child: CircularProgressIndicator(),
                //   //     ),
                //   //   ),
                //   // );
                // }
                if (state is AppointmentSuccess) {
                  final response = state.appoinments;
                  if (response.isEmpty) {
                    return Center(
                      child: Text(
                        'No appointments yet',
                        style: TextStyles.font16dark
                            .copyWith(color: AppColors.darkgray2),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: response.length,
                    itemBuilder: (context, index) {
                      final appointment = response[index];
                      return AppointmentWidget(appointment: appointment);
                    },
                  );
                }

                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.h, left: 15.h, right: 15.h),
                        child: Shimmer.fromColors(
                          baseColor: AppColors.gray,
                          highlightColor: AppColors.lightgray,
                          child: Container(
                            height: 160.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.white, ////////////////
                                borderRadius: BorderRadius.circular(14.r)),
                          ),
                        ));
                  },
                );
              },
            )),
      ),
    );
  }
}

import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<AppointmentCubit>()..getallappointments(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(
                  'Your next appointments',
                  style: TextStyles.font18dark,
                ),
                toolbarHeight: 65,
              ),
              BlocBuilder<AppointmentCubit, AppointmentState>(
                builder: (context, state) {
                  if (state is AppointmentLoading) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  if (state is AppointmentSuccess) {
                    final response = state.appoinments;
                    return SliverList.builder(
                      itemCount: response.length,
                      itemBuilder: (context, index) {
                        final appointment = response[index];
                        return AppointmentWidget(appointment: appointment);
                      },
                    );
                  }
                  if (state is AppointmentFailed) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text('No appointments found'),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('No appointments found'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

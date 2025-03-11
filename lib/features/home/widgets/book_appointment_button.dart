import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/appointment/get%20appointments/data/appointment_response.dart';
import 'package:vcare/features/appointment/schedule_appoinment/cubit/storeappointment_cubit.dart';
import 'package:vcare/features/home/screens/detailed_doctor_screen.dart';
import 'package:vcare/features/login/cubit/login_cubit.dart';

class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key, required this.docLocation});
  final docLocation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Appsizes.buttonsheight,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.mainblue,
            //padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text(
            'Book Appointment',
            style: TextStyles.font16light,
          ),
          onPressed: () {
            final cubitinstance = context.read<StoreappointmentCubit>();
            if (context.read<StoreappointmentCubit>().time != -1 &&
                cubitinstance != -1) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (dialogcontext) {
                  int time = context.read<StoreappointmentCubit>().time;
                  bool pm = (time >= 12);
                  if (time > 12) {
                    time = time - 12;
                  }
                  final date = context.read<StoreappointmentCubit>().date;
                  return BlocProvider.value(
                    value: cubitinstance,
                    child: Dialog(
                      backgroundColor: AppColors.white,
                      alignment: Alignment.bottomCenter,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r)),
                      ),
                      insetPadding: const EdgeInsets.all(0),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 15.h, right: 15.w, left: 15.w),
                        child: BlocBuilder<StoreappointmentCubit,
                            StoreappointmentState>(
                          builder: (context, state) {
                               if (state is Storeappointmentsuccess) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                // SizedBox(
                                //   height: 25.h,
                                //   width: double.infinity,
                                // ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 50.sp,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                      width: double.infinity,
                                    ),
                                    Text(
                                      'Booking Confirmed',
                                      style: TextStyles.font18dark.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkblue),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                //Expanded(child: SizedBox()),
                                SizedBox(
                                    height: Appsizes.buttonsheight,
                                    width: double.infinity,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.mainblue,
                                          //padding: EdgeInsets.symmetric(vertical: 12.h),
                                        ),
                                        child: Text(
                                          'Done',
                                          style: TextStyles.font16light,
                                        ),
                                        onPressed: () {
                                          Navigator.popUntil(context,
                                              (route) => route.isFirst);
                                        })),
                              ],
                            );
                                }
                            if (state is Storeappointmentloading) {
                              return SizedBox(
                                height: 150.h,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                      width: double.infinity,
                                    ),
                                    SizedBox(
                                      width: 30.h,
                                      height: 30.h,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 5,
                                        color: AppColors.darkblue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                      width: double.infinity,
                                    ),
                                    Text(
                                      'Please wait...',
                                      style: TextStyles.font18dark.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkblue),
                                    ),
                                  ],
                                ),
                              );
                            }
                            if (state is Storeappointmentfailed) {
                              return SizedBox(
                                height: 150.h,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                      width: double.infinity,
                                    ),
                                    Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 40.sp,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                      width: double.infinity,
                                    ),
                                    Text(
                                      'We Are Sorry.. Try Again!',
                                      style: TextStyles.font18dark.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkblue),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.edit_calendar_rounded,
                                        size: 60.sp, color: AppColors.darkblue),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Booking Confirmation',
                                      style: TextStyles.font18dark.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkblue),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.lightgray,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Padding(
                                    padding: EdgeInsets.all(14.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                                Icons.calendar_month_rounded,
                                                color: AppColors.black),
                                            Text(
                                              ' Date',
                                              style: TextStyles.font16dark
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.black),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Text(
                                              '${getMonthName(date.month)} ${date.day}, ${date.year}',
                                              style: TextStyles.font16dark
                                                  .copyWith(
                                                      color:
                                                          AppColors.darkblue),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 25.w,
                                          color: AppColors.gray,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                                Icons.access_alarm_rounded,
                                                color: AppColors.black),
                                            Text(
                                              ' Time',
                                              style: TextStyles.font16dark
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Text(
                                              pm
                                                  ? '${time}:00 PM'
                                                  : '${time}:00 AM',
                                              style: TextStyles.font16dark
                                                  .copyWith(
                                                      color:
                                                          AppColors.darkblue),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 25.w,
                                          color: AppColors.gray,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.location_on,
                                                    color: AppColors.black),
                                                Text(
                                                  ' Address',
                                                  style: TextStyles.font16dark
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 120.w,
                                              child: Text(
                                                docLocation,
                                                style: TextStyles.font16dark
                                                    .copyWith(
                                                        color:
                                                            AppColors.darkblue),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                textAlign: TextAlign.end,
                                                textDirection:
                                                    TextDirection.ltr,
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                //confirm button
                                SizedBox(
                                  height: Appsizes.buttonsheight,
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () async {
                                      await context
                                          .read<StoreappointmentCubit>()
                                          .storeappointment();
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: TextStyles.font16dark
                                          .copyWith(color: AppColors.white),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.mainblue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.r))
                                        // padding: EdgeInsets.symmetric(
                                        //     horizontal: 14.h),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                //cancel button
                                SizedBox(
                                  height: Appsizes.buttonsheight,
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel',
                                        style: TextStyles.font16dark
                                        //.copyWith(color: AppColors.white),
                                        ),
                                    style: TextButton.styleFrom(
                                      //backgroundColor: AppColors.white,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          side: BorderSide(
                                              width: 2,
                                              color: AppColors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Choose a time slot'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
            // context.read<StoreappointmentCubit>().doctorId =
            //     doctor.id;
            // context
            //     .read<StoreappointmentCubit>()
            //     .storeappointment();
          },
        ));
  }
}

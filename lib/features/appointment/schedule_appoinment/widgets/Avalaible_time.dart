import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vcare/core/networking/check%20internet/retry_dialog.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/appointment/schedule_appoinment/cubit/storeappointment_cubit.dart';
import 'package:vcare/features/home/screens/detailed_doctor_screen.dart';

class AvalaibleTime extends StatefulWidget {
  AvalaibleTime({super.key});

  @override
  State<AvalaibleTime> createState() => _AvalaibleTimeState();

  int selectedday = DateTime.now().day;
  List<int> emptyslots = [14, 15, 17, 18]; //empty slots should be from backend
  int selectedtime = 30;
}

class _AvalaibleTimeState extends State<AvalaibleTime> {
  final PageController dateslidercontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 200.h,
      // padding: EdgeInsets.symmetric(
      //   vertical: 10.w,
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          //   child: Text(
          //     'Day',
          //     style: TextStyles.font16dark,
          //   ),
          // ),
          // SizedBox(
          //   height: 85.w,
          //   child: ListView.builder(
          //     itemCount: 7,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       final datenow = DateTime.now().add(Duration(days: index));
          //       bool selected = (datenow.day == widget.selectedday);
          //       bool today = (index == 0);
          //       return InkWell(
          //         onTap: () {
          //           widget.selectedday = datenow.day;
          //           setState(() {});
          //         },
          //         child: Container(
          //           width: today ? 85.w : 50.w,
          //           height: 85.w,
          //           margin: EdgeInsets.only(
          //               right: 8.w, left: (index == 0) ? 8.w : 0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(today ? 30.sp : 100),
          //             border: Border.all(
          //                 color:
          //                     selected ? AppColors.mainpurple : AppColors.gray,
          //                 width: 2.w),
          //             color: AppColors.gray,
          //           ),
          //           child: today
          //               ? Center(
          //                   child: Text(
          //                   'Today',
          //                   style: TextStyles.font16dark.copyWith(
          //                     fontWeight: FontWeight.w500,
          //                     color: selected
          //                         ? AppColors.mainpurple
          //                         : AppColors.black,
          //                   ),
          //                 ))
          //               : Column(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     Expanded(
          //                       child: Center(
          //                         child: Text(
          //                           getMonthName(datenow.month),
          //                           style: TextStyles.font13dark.copyWith(
          //                             fontSize: 14.sp,
          //                             fontWeight: FontWeight.w500,
          //                             color: selected
          //                                 ? AppColors.mainpurple
          //                                 : AppColors.black,
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     Container(
          //                       height: 42.w,
          //                       margin: EdgeInsets.only(
          //                         bottom: 2.w,
          //                       ),
          //                       alignment: Alignment.center,
          //                       decoration: BoxDecoration(
          //                           color: AppColors.white,
          //                           shape: BoxShape.circle),
          //                       child: Text(
          //                         datenow.day.toString(),
          //                         style: TextStyles.font16dark.copyWith(
          //                           color: selected
          //                               ? AppColors.mainpurple
          //                               : AppColors.black,
          //                           //fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  dateslidercontroller.previousPage(
                      duration: Duration(seconds: 1), curve: Curves.ease);
                  if (dateslidercontroller.page != 0) {
                    context.read<StoreappointmentCubit>().date = context
                        .read<StoreappointmentCubit>()
                        .date
                        .add(Duration(days: -1));
                    print(context.read<StoreappointmentCubit>().date);
                  }
                },
                icon: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: PageView.builder(
                    itemCount: 7,
                    controller: dateslidercontroller,
                    itemBuilder: (context, index) {
                      final datenow = DateTime.now().add(Duration(days: index));
                      final day = datenow.day.toString();
                      bool selected = (datenow.day == widget.selectedday);
                      bool today = (index == 0);
                      bool tommorow = (index == 1);
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            today
                                ? 'Today'
                                : tommorow
                                    ? 'Tommorow'
                                    : getDayName(datenow),
                            style: TextStyles.font16dark
                                .copyWith(color: AppColors.mainblue),
                          ),
                          (!today && !tommorow)
                              ? Text(
                                  day,
                                  style: TextStyles.font21dark
                                      .copyWith(color: AppColors.mainblue),
                                )
                              : SizedBox(),
                        ],
                      ));
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  dateslidercontroller.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.ease);
                  if (dateslidercontroller.page != 6) {
                    context.read<StoreappointmentCubit>().date = context
                        .read<StoreappointmentCubit>()
                        .date
                        .add(Duration(days: 1));
                    print(context.read<StoreappointmentCubit>().date);
                  }
                },
                icon: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              'Time Slots',
              style: TextStyles.font16dark,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6.w, // Space between columns
                mainAxisSpacing: 6.h, // Space between rows
                childAspectRatio: 2 / 1,
              ),
              itemCount: widget.emptyslots.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                bool pm = (widget.emptyslots[index] >= 12);
                bool remove12hours = (widget.emptyslots[index] > 12);
                bool selected =
                    (widget.selectedtime == widget.emptyslots[index]);
                return InkWell(
                  onTap: () {
                    widget.selectedtime = widget.emptyslots[index];
                    print(widget.selectedtime);
                    context.read<StoreappointmentCubit>().time =
                        widget.selectedtime;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: selected ? AppColors.mainblue : AppColors.gray,
                        border: Border.all(
                            width: selected ? 4 : 2,
                            color: selected
                                ? AppColors.mainblue
                                : AppColors.white),
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          remove12hours
                              ? '${(widget.emptyslots[index] - 12).toString()}:00 '
                              : '${widget.emptyslots[index].toString()}:00 ',
                          style: TextStyles.font16dark.copyWith(
                              fontWeight: FontWeight.normal,
                              color:
                                  selected ? AppColors.white : AppColors.black),
                        ),
                        Text(
                          pm ? 'PM' : 'AM',
                          style: TextStyles.font16dark.copyWith(
                              fontWeight: FontWeight.normal,
                              color:
                                  selected ? AppColors.white : AppColors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}

String getDayName(DateTime date) {
  return DateFormat('EEEE').format(date); // Full day name (e.g., Monday)
}

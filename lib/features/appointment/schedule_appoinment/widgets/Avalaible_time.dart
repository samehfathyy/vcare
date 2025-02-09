import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              'Day',
              style: TextStyles.font16dark,
            ),
          ),
          SizedBox(
            height: 85.w,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final datenow = DateTime.now().add(Duration(days: index));
                bool selected = (datenow.day == widget.selectedday);
                return InkWell(
                  onTap: () {
                    widget.selectedday = datenow.day;
                    setState(() {});
                  },
                  child: Container(
                    width: 50.w,
                    height: 85.w,
                    margin: EdgeInsets.only(
                        right: 8.w, left: (index == 0) ? 8.w : 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color:
                              selected ? AppColors.mainpurple : AppColors.gray,
                          width: 2.w),
                      color: AppColors.gray,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              getMonthName(datenow.month),
                              style: TextStyles.font13dark.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: selected
                                    ? AppColors.mainpurple
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 42.w,
                          margin: EdgeInsets.only(
                            bottom: 2.w,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.white, shape: BoxShape.circle),
                          child: Text(
                            datenow.day.toString(),
                            style: TextStyles.font16dark.copyWith(
                              color: selected
                                  ? AppColors.mainpurple
                                  : AppColors.black,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              'Time',
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
                childAspectRatio: 2.7 / 1,
              ),
              itemCount: widget.emptyslots.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                bool selected =
                    (widget.selectedtime == widget.emptyslots[index]);
                return InkWell(
                  onTap: () {
                    widget.selectedtime = widget.emptyslots[index];
                    print(widget.selectedtime);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.lightgray,
                        border: Border.all(
                            width: 2,
                            color: selected
                                ? AppColors.mainpurple
                                : AppColors.darkgray),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Text(
                      '${widget.emptyslots[index].toString()}:00 - ${(widget.emptyslots[index] + 1).toString()}:00',
                      style: TextStyles.font13dark.copyWith(
                          color: selected
                              ? AppColors.mainpurple
                              : AppColors.darkgray),
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

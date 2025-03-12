import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';

class Pinnedtitle extends StatelessWidget {
  Pinnedtitle({super.key, required this.title, this.pinned = false});
  final String title;
  bool pinned;
  @override
  Widget build(BuildContext context) {
    double textHeight =
        calculateTextHeight('data', TextStyles.font21dark, double.infinity, 1);
    return SliverPersistentHeader(
      pinned: pinned,
      floating: false,
      delegate: sliverpinnedwidgetdelegate(
          child: Container(
            height: textHeight,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: AppColors.lightgray,
            child: Text(
              title,
              style: TextStyles.font21dark,
              maxLines: 1,
            ),
          ),
          height: textHeight + 15.h),
    );
  }
}

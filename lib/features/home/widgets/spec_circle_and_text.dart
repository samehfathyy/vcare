import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/data/repo/specializations_map.dart';
import 'package:vcare/features/home/screens/doctors_list_screen.dart';

class SpecCircleAndText extends StatefulWidget {
  const SpecCircleAndText({
    super.key,
    required this.index,
    required this.name,
    required this.mapkey,
    required this.circleiconpressed,
    required this.selected,
  });
  final int index;
  final String name;
  final String mapkey;
  final int selected;
  final Function circleiconpressed;

  @override
  State<SpecCircleAndText> createState() => _SpecCircleAndTextState();
}

class _SpecCircleAndTextState extends State<SpecCircleAndText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            print('object');
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DoctorsListScreen(
                    spec: context
                            .read<HomeCubit>()
                            .allspecializations![widget.index]!
                            );
              },
            ));

            print('pressed');
            //setState(() {});
          },
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            //width: 60.w,
            //height: 60.w,
            padding: EdgeInsets.all(12.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              // border: Border.all(
              //   width: 2,
              //   color: widget.selected == widget.index
              //       ? AppColors.mainpurple
              //       : Colors.transparent,
              // ),
              color: AppColors.white,
              //shape: BoxShape.circle
            ),
            child: Image.asset(
              // SpecializationsMap.specializationsiconsmap[widget.mapkey]
              //     .toString(),
              'assets/images/specsicons/${widget.name.toLowerCase()}.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        SizedBox(
          width: 82.w,
          //height: 40.h,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            widget.name,
            textAlign: TextAlign.center,
            style: TextStyles.font13dark,
          ),
        ),
      ],
    );
  }
}

class speccircleshimmer extends StatefulWidget {
  const speccircleshimmer({super.key});
  @override
  State<speccircleshimmer> createState() => _speccircleshimmerState();
}

class _speccircleshimmerState extends State<speccircleshimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.lightgray,
      child: Container(
        height: 70.h,
        width: 70.h,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            color: AppColors.black,
            border: Border.all(width: 2.w, color: AppColors.black),
            shape: BoxShape.circle),
      ),
    );
  }
}

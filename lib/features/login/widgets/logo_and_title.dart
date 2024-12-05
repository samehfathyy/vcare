import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vcare/core/theming/textstyles.dart';

class LogoAndTitle extends StatefulWidget {
  const LogoAndTitle({super.key});

  @override
  State<LogoAndTitle> createState() => _LogoAndTitleState();
}

class _LogoAndTitleState extends State<LogoAndTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/docdoc_logo.svg',
          width: 60.w,
          height: 60.w,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Let\'s Sign you in!',
          style: TextStyles.font22dark,
        ),
      ],
    );
  }
}

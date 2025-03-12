import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> tips = [
    'COVID RT-PCR',
    'Cancer Checkup',
    'Fasting Blood Sugar',
  ];
  final List<String> tips2 = [
    'Known as covid-19',
    'Take the first step to detect cancer',
    'Known As glucose fasting blood',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 6), (Timer timer) {
      if (_currentPage < tips.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidth =
        MediaQuery.of(context).size.width - 170.w; // Adjust for padding
    double textHeight =
        calculateTextHeight('text', TextStyles.font21light, maxWidth, 1);
    textHeight = textHeight +
        calculateTextHeight('text\n sa', TextStyles.font16light, maxWidth, 2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: textHeight + 16 + 40.h, // Adjust height as needed
          child: PageView.builder(
            controller: _pageController,
            itemCount: tips.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  //height: 150,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: AppColors.mainblue,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/home_blue_pattern.png'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tips[index],
                            style: TextStyles.font21light,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Image.asset(
                          //   'assets/images/scan.png',
                          //   height: 40.h,
                          // )
                        ],
                      ),
                      //Expanded(child: SizedBox()),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: maxWidth,
                              child: Text(
                                tips2[index],
                                style: TextStyles.font16light,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              width: 110.w,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Book now',
                                  style: TextStyles.font14dark,
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 8.h)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: tips.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}


// class StackWidget extends StatelessWidget {
//   const StackWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       child: SizedBox(
//         height: 180.h,
//         width: double.infinity,
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 18.w, top: 12.h, bottom: 12.h),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   //color: AppColors.mainpurple,
//                   image: const DecorationImage(
//                       fit: BoxFit.fill,
//                       image:
//                           AssetImage('assets/images/home_blue_pattern.png'))),
//               height: 150.h,
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Book and\nschedule with\nnearest doctor',
//                     style: TextStyles.font21dark
//                         .copyWith(height: 1.1.h, color: AppColors.white),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                         backgroundColor: AppColors.white,
//                         padding: EdgeInsets.symmetric(horizontal: 20.w)),
//                     child: Text(
//                       'Find Nearby',
//                       style: TextStyles.font13darkgray.copyWith(
//                           color: AppColors.black, fontWeight: FontWeight.w600),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Positioned(
//               right: 0,
//               bottom: 0,
//               child: Image.asset(
//                 'assets/images/doctor.png',
//                 //width: 140.w,
//                 height: 180.h,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

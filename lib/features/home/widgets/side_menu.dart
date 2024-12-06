import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcare/core/helper/shared_pref_helper.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/login/screens/login_screen.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightgray,
      child: SafeArea(
        child: BlocBuilder<UserprofileCubit, UserprofileState>(
          builder: (context, state) {
            if (state is UserprofileSuccess) {
              final user = state.userProfileResponseModel.data![0]!;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'profileicon',
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // Container(
                                    //   width: 43.w,
                                    //   height: 43.w,
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.transparent,
                                    //       shape: BoxShape.circle,
                                    //       border: Border.all(
                                    //           width: 2.w,
                                    //           color: AppColors.black)),
                                    // ),
                                    Container(
                                      width: 40.w,
                                      height: 40.w,
                                      decoration: const BoxDecoration(
                                        color: AppColors.mainpurple,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: AppColors.lightgray,
                                      size: 30.sp,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.w,
                              ),
                              Text(
                                '${user.name}',
                                style: TextStyles.font18dark
                                    .copyWith(fontSize: 20.sp),
                              ),
                              Text(
                                '${user.email}',
                                style: TextStyles.font13darkgray
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //spacer(),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: AppColors.darkgray2,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Appointments',
                            style: TextStyles.font14dark,
                          )
                        ],
                      ),
                      spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.rate_review_rounded,
                            color: AppColors.darkgray2,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Reviews',
                            style: TextStyles.font14dark,
                          )
                        ],
                      ),
                      spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.account_box,
                            color: AppColors.darkgray2,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Profile',
                            style: TextStyles.font14dark,
                          )
                        ],
                      ),
                      spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            color: AppColors.darkgray2,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'App Settings',
                            style: TextStyles.font14dark,
                          )
                        ],
                      ),
                      spacer(),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextButton(
                          onPressed: () async {
                            await SharedPrefHelper.clearAllSecuredData();
                            await SharedPrefHelper.setData(
                                SharedPrefHelper.loggedIn, false);
                            await appDialog(
                                context: context,
                                title: 'Signing out',
                                alertdialog: false,
                                icon: null);
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign out',
                                style: TextStyles.font14dark
                                    .copyWith(color: Colors.red),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }
            return Shimmer.fromColors(
                baseColor: AppColors.gray,
                highlightColor: AppColors.lightgray,
                child: Expanded(
                    child: Container(
                  color: Colors.white,
                )));
          },
        ),
      ),
    );
  }
}

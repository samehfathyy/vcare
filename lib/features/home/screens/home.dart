import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/widgets/doctor_widget.dart';
import 'package:vcare/features/home/widgets/side_menu.dart';
import 'package:vcare/features/home/widgets/spec_circle_and_text.dart';
import 'package:vcare/features/home/widgets/stack_widget.dart';
import 'package:vcare/features/login/screens/login_screen.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';

Widget spacer() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.h),
    color: AppColors.gray,
    width: double.infinity,
    height: 0.5.h,
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _doctorsScrollController;
  late ScrollController _specializationsScrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _doctorsScrollController = ScrollController();
    _specializationsScrollController = ScrollController();
  }

  @override
  void dispose() {
    _doctorsScrollController.dispose();
    _specializationsScrollController.dispose();
    super.dispose();
  }

  void doctorslistAutoScroll(double position) {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (_doctorsScrollController.hasClients) {
        _doctorsScrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void specializationslistAutoScroll(double position) {
    if (position < 0) {
      position = 0;
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      if (_specializationsScrollController.hasClients) {
        _specializationsScrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  int selectedspecindex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<UserprofileCubit>().getuserprofile();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.lightgray,
        endDrawer: const SideMenu(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) {
              //getIt<HomeCubit>().filterdoctors(0);
              return getIt<HomeCubit>()..getdata();
            }),
          ],
          child: SafeArea(
            child: CustomScrollView(
              controller: _doctorsScrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: BlocListener<UserprofileCubit, UserprofileState>(
                    child: const SizedBox(),
                    listenWhen: (previous, current) =>
                        current is UserprofileFailed,
                    listener: (context, state) async {
                      if (state is UserprofileFailed && context.mounted) {
                        // await SharedPrefHelper.clearAllSecuredData();
                        // await SharedPrefHelper.setData(
                        //     SharedPrefHelper.loggedIn, false);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      }
                    },
                  ),
                ),

                // SliverToBoxAdapter(
                //   child: BlocBuilder<UserprofileCubit, UserprofileState>(
                //     builder: (context, state) {
                //       return TextButton(
                //           onPressed: () async {
                //             await SharedPrefHelper.clearAllSecuredData();
                //             await SharedPrefHelper.setData(
                //                 SharedPrefHelper.loggedIn, false);
                //             Navigator.of(context)
                //                 .pushReplacement(MaterialPageRoute(
                //               builder: (context) => LoginScreen(),
                //             ));
                //             //context.read<UserprofileCubit>().getuserprofile();
                //           },
                //           child: Text('log out'));
                //     },
                //   ),
                // ),
                SliverPersistentHeader(
                  pinned: true,
                  //floating: true,
                  delegate: sliverpinnedwidgetdelegate(
                      child: Container(
                        color: AppColors.lightgray,
                        child: SizedBox(
                          height: 50.h,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 10.h,
                                bottom: 5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BlocBuilder<UserprofileCubit, UserprofileState>(
                                  builder: (context, state) {
                                    if (state is UserprofileSuccess) {
                                      return Text(
                                        'Hello, ${state.userfirstname}!',
                                        style: TextStyles.font21dark,
                                      );
                                    }
                                    if (state is UserprofileFailed) {
                                      return Text(
                                        'you need to login',
                                        style: TextStyles.font21dark,
                                      );
                                    }

                                    return Text(
                                      'Hello',
                                      style: TextStyles.font21dark,
                                    );
                                  },
                                ),
                                // SvgPicture.asset(
                                //   'assets/svgs/docdoc_logo.svg',
                                //   height: 30.h,
                                // ),
                                Hero(
                                  tag: 'profileicon',
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 32.w,
                                        decoration: const BoxDecoration(
                                          color: AppColors.darkgray2,
                                          shape: BoxShape.circle,
                                          // border: Border.all(
                                          //     width: 2.w,
                                          //     color: AppColors.mainpurple),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _scaffoldKey.currentState!
                                              .openEndDrawer();
                                        },
                                        icon: const Icon(
                                          Icons.person,
                                          color: AppColors.lightgray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      height: 55.h),
                ),

                const SliverToBoxAdapter(
                  child: StackWidget(),
                ),

                //specializations title
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      //color: AppColors.mainpurple,
                      height: 42.h,
                      child: Text(
                        'Medical Specializations',
                        style: TextStyles.font21dark,
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 5.h,
                  ),
                ),
                //specializations list
                SliverPersistentHeader(
                  pinned: true,
                  //floating: true,
                  delegate: sliverpinnedwidgetdelegate(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previous, current) =>
                            (current is HomeSuccess ||
                                current is HomeFailed ||
                                current is HomeLoading),
                        builder: (context, state) {
                          if (state is HomeSuccess) {
                            return Container(
                              color: AppColors.lightgray,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 110.h,
                                    //color: AppColors.gray,
                                    child: ListView.builder(
                                      controller:
                                          _specializationsScrollController,
                                      itemCount:
                                          state.specializationslist.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(left: 8.w),
                                          child: SpecCircleAndText(
                                            index: index,
                                            name: state
                                                    .specializationslist[index]
                                                    ?.name ??
                                                '',
                                            mapkey: state
                                                    .specializationslist[index]
                                                    ?.name
                                                    .toLowerCase() ??
                                                '',
                                            circleiconpressed: () {
                                              selectedspecindex = index;

                                              context
                                                  .read<HomeCubit>()
                                                  .refreshspecslist();

                                              doctorslistAutoScroll(
                                                  190.h + 42.h);
                                              context
                                                  .read<HomeCubit>()
                                                  .filterdoctors(index);
                                              specializationslistAutoScroll(
                                                  (index) * 88.w);
                                            },
                                            selected: selectedspecindex,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container(
                            color: AppColors.lightgray,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 110.h,
                                    //color: AppColors.gray,
                                    child: ListView.builder(
                                        itemCount: 6,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(left: 8.w),
                                            child: const speccircleshimmer(),
                                          );
                                        })),
                              ],
                            ),
                          );
                        },
                      ),
                      height: 110.h),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 5.h,
                  ),
                ),

                //doctors list
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) => (current is DoctorsFailed ||
                      current is DoctorsSuccess ||
                      current is DoctorsLoading),
                  builder: (context, state) {
                    if (state is DoctorsSuccess) {
                      return SliverList.builder(
                        itemCount: state.doctorlist.length,
                        itemBuilder: (context, index) {
                          if (state.doctorlist[index] != null) {
                            Doctor doctor = state.doctorlist[index]!;
                            return DoctorWidget(doctor: doctor);
                          }
                          return const Center(
                            child: Text('No Doctors found'),
                          );
                        },
                      );
                    }

                    return SliverList.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const doctorwidgetshimmer();
                      },
                    );
                  },
                ),
                //to fill any remaining space when scrolling
                const SliverFillRemaining(
                  child: SizedBox(),
                )
              ],
            ),
          ),
        ));
  }
}


// TextButton(
//             onPressed: () async {
//               await SharedPrefHelper.clearAllSecuredData();
//               await SharedPrefHelper.setData(SharedPrefHelper.loggedIn, false);
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (context) => LoginScreen(),
//               ));
//             },
//             child: Text('log out')),
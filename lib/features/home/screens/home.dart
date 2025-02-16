import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';
import 'package:vcare/features/appointment/schedule_appoinment/cubit/storeappointment_cubit.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/data/models/specialization_response_model.dart';
import 'package:vcare/features/home/widgets/doctor_widget.dart';
import 'package:vcare/features/home/widgets/spec_circle_and_text.dart';
import 'package:vcare/features/home/widgets/stack_widget.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';

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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.lightgray,
      body: SafeArea(
        child: CustomScrollView(
          controller: _doctorsScrollController,
          slivers: [
            // SliverToBoxAdapter(
            //   child: BlocListener<UserprofileCubit, UserprofileState>(
            //     //child: const SizedBox(),
            //     listenWhen: (previous, current) => current is UserprofileFailed,
            //     listener: (context, state) async {
            //       if (state is UserprofileFailed && context.mounted) {
            //         // await SharedPrefHelper.clearAllSecuredData();
            //         // await SharedPrefHelper.setData(
            //         //     SharedPrefHelper.loggedIn, false);

            //         Navigator.of(context).pushReplacement(MaterialPageRoute(
            //           builder: (context) => const LoginScreen(),
            //         ));
            //       }
            //     },
            //   ),
            // ),

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
                            left: 20.w, right: 20.w, top: 10.h, bottom: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BlocBuilder<UserprofileCubit, UserprofileState>(
                              builder: (context, state) {
                                print('user builder is called');
                                if (state is UserprofileSuccess) {
                                  return Text(
                                    'Hello, ${state.userfirstname}!',
                                    style: TextStyles.font21dark,
                                  );
                                }

                                return Text(
                                  'Hello',
                                  style: TextStyles.font21dark,
                                );
                              },
                            ),
                            SvgPicture.asset(
                              'assets/svgs/docdoc_logo.svg',
                              height: 30.h,
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
            //space
            SliverToBoxAdapter(
              child: SizedBox(
                height: 5.h,
              ),
            ),

            //specializations list
            SliverToBoxAdapter(
              //pinned: true,
              //floating: true,

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: SizedBox(
                  height: 450,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeSuccess) {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 1.4,
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 8.h,
                                  crossAxisSpacing: 10.w),
                          itemCount: state.specializationslist.length,
                          itemBuilder: (context, index) {
                            print(state.specializationslist[index]?.name ?? '');
                            return SpecCircleAndText(
                              index: index,
                              name:
                                  state.specializationslist[index]?.name ?? '',
                              mapkey: state.specializationslist[index]?.name
                                      .toLowerCase() ??
                                  '',
                              circleiconpressed: () {
                                selectedspecindex = index;

                                context
                                    .read<HomeCubit>()
                                    .filterdoctors(selectedspecindex);
                                //context.read<HomeCubit>().refreshspecslist();
                              },
                              selected: selectedspecindex,
                            );
                          },
                        );
                      }
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
                                  controller: _specializationsScrollController,
                                  itemCount: state.specializationslist.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: SpecCircleAndText(
                                        index: index,
                                        name: state.specializationslist[index]
                                                ?.name ??
                                            '',
                                        mapkey: state.specializationslist[index]
                                                ?.name
                                                .toLowerCase() ??
                                            '',
                                        circleiconpressed: () {
                                          selectedspecindex = index;

                                          context
                                              .read<HomeCubit>()
                                              .filterdoctors(selectedspecindex);
                                          context
                                              .read<HomeCubit>()
                                              .refreshspecslist();

                                          doctorslistAutoScroll(190.h + 42.h);
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
                      if (state is HomeLoading) {
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
                      }
                      if (state is HomeFailed) {
                        return const Center(
                          child: Text('it seems you have no internet'),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 5.h,
              ),
            ),

            //doctors list
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                print('doctors builder is called');
                print(state);
                if (state is HomeLoading) {
                  return SliverList.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const doctorwidgetshimmer();
                    },
                  );
                } else if (state is HomeSuccess) {
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
                } else if (state is HomeFailed) {
                  return const SliverToBoxAdapter(
                      child: Icon(
                    Icons.error_rounded,
                    color: Colors.red,
                  ));
                }
                return const SliverToBoxAdapter(
                    child: Icon(
                  Icons.error_rounded,
                  color: Colors.red,
                ));
              },
            ),
            //to fill any remaining space when scrolling
            const SliverFillRemaining(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
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
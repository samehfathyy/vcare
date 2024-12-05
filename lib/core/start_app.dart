import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/networking/check%20internet/cubit/check_internet_cubit.dart';
import 'package:vcare/core/networking/check_internet.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/home/screens/home.dart';
import 'package:vcare/features/login/screens/login_screen.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key, required this.loggedIn});
  final bool loggedIn;

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CheckInternetCubit>()..checkinternet(),
        ),
        BlocProvider(
          create: (context) {
            return getIt<UserprofileCubit>()..getuserprofile();
          },
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // widget.loggedIn ? const Home() : const LoginScreen()
          home: BlocBuilder<CheckInternetCubit, CheckInternetState>(
            builder: (context, state) {
              if (state is CheckInternetLoading) {
                return CircularProgressIndicator();
              } else if (state is CheckInternetSuccess && widget.loggedIn) {
                return Home();
              } else if (state is CheckInternetSuccess && !widget.loggedIn) {
                return LoginScreen();
              } else {
                return retryscreen();
              }
            },
          ),
        ),
      ),
    );
  }
}

class retryscreen extends StatelessWidget {
  const retryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 0.h,
              ),
              Column(
                children: [
                  Icon(
                    Icons.signal_wifi_connected_no_internet_4,
                    size: 50.sp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'it seems there is something wrong with\nyour internet connection',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(25.h),
                child: TextButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppColors.mainpurple,
                          )),
                          backgroundColor: Colors.transparent,
                        );
                      },
                    );
                    Future.delayed(
                      Duration(milliseconds: 1200),
                      () {
                        Navigator.of(context).pop();
                        context.read<CheckInternetCubit>().checkinternet();
                      },
                    );
                  },
                  child: Text(
                    'Try again',
                    style: TextStyles.font16light,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.mainpurple,
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 10.h)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('app bar'),
            pinned: false,
            floating: true,
          ),
          SliverAppBar(
            pinned: false,
            //stretch: true,
            //expandedHeight: 50,
            title: Container(
              height: 50,
              width: double.infinity,
              color: AppColors.mainpurple,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: sliverpinnedwidgetdelegate(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: AppColors.black,
                ),
                height: 50),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: sliverpinnedwidgetdelegate(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: AppColors.mainpurple,
                ),
                height: 50),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Text(index.toString());
            },
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserprofileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
      ],
      child: Container(),
    );
  }
}

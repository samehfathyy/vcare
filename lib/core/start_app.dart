import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/helper/shared_pref_helper.dart';
import 'package:vcare/core/networking/check%20internet/cubit/check_internet_cubit.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';
import 'package:vcare/features/home/cubit/cubit/home_cubit.dart';
import 'package:vcare/features/login/screens/login_screen.dart';
import 'package:vcare/features/user_profile/data/cubit/cubit/userprofile_cubit.dart';
import 'package:vcare/vcare_app.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key, required this.loggedIn});
  final bool loggedIn;

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  bool dialogisopened = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return getIt<UserprofileCubit>()..getuserprofile();
          },
        ),
        BlocProvider(
          create: (context) {
            return getIt<HomeCubit>();
          },
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // widget.loggedIn ? const Home() : const LoginScreen()

          // home: BlocBuilder<CheckInternetCubit, CheckInternetState>(
          //   builder: (context, state) {
          //     if (state is CheckInternetSuccess && widget.loggedIn) {
          //       return const VcareApp();
          //     } else if (state is CheckInternetSuccess && !widget.loggedIn) {
          //       return const LoginScreen();
          //     } else {
          //       return const retryscreen();
          //     }
          //   },
          // ),

          home: MultiBlocListener(
            listeners: [
              BlocListener<UserprofileCubit, UserprofileState>(
                listenWhen: (previous, current) => current is UserprofileFailed,
                listener: (context, state) async {
                  if (state is UserprofileFailed && context.mounted) {
                    await SharedPrefHelper.clearAllSecuredData();
                    await SharedPrefHelper.setData(
                        SharedPrefHelper.loggedIn, false);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  }
                },
              ),
            ],
            child: widget.loggedIn ? const VcareApp() : const LoginScreen(),
          ),
          // home: widget.loggedIn?VcareApp():LoginScreen(),
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
                  const Text(
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
                        return const Dialog(
                          backgroundColor: Colors.transparent,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppColors.mainblue,
                          )),
                        );
                      },
                    );
                    Future.delayed(
                      const Duration(milliseconds: 1200),
                      () async {
                        Navigator.of(context).pop();
                        await context
                            .read<CheckInternetCubit>()
                            .checkinternet();
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.mainblue,
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 10.h)),
                  child: Text(
                    'Try again',
                    style: TextStyles.font16light,
                  ),
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
              color: AppColors.mainblue,
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
                  color: AppColors.mainblue,
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
  const MyWidget({super.key});

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

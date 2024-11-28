import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/networking/check_internet.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/theming/theming%20helper/sliverpinnedwidgetdelegate.dart';
import 'package:vcare/core/widgets/app_dialog.dart';
import 'package:vcare/features/login/screens/login_screen.dart';

class StartApp extends StatefulWidget {
  StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  void initState() {
    // TODO: implement initState
    //NetworkStatus status = await NetworkChecker.getNetworkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
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
          SliverAppBar(
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
                50),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: sliverpinnedwidgetdelegate(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: AppColors.mainpurple,
                ),
                50),
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

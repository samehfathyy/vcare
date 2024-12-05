import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/helper/shared_pref_helper.dart';
import 'package:vcare/core/networking/check_internet.dart';
import 'package:vcare/core/networking/dio_factory.dart';
import 'package:vcare/core/start_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupgetit();
  bool loggedIn =
      await SharedPrefHelper.getBool(SharedPrefHelper.loggedIn) ?? false;
  if (loggedIn) {
    await DioFactory.setTokenIntoHeaderAfterLogin();
  }
  await ScreenUtil.ensureScreenSize();
  runApp(
    StartApp(
      loggedIn: loggedIn,
    ),
  );
}

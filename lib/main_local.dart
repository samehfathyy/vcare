import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/helper/shared_pref_helper.dart';
import 'package:vcare/core/start_app.dart';

void main() async {
  //NetworkStatus status = await NetworkChecker.getNetworkStatus();
  bool loggedIn = SharedPrefHelper.getBool(SharedPrefHelper.loggedIn)??false;
  if(loggedIn){
    SharedPrefHelper.getSecuredString(SharedPrefHelper.userToken);
  }
  setupgetit();
  await ScreenUtil.ensureScreenSize();
  runApp(StartApp(loggedIn: loggedIn,));
}

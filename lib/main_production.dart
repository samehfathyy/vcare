import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/networking/check_internet.dart';
import 'package:vcare/core/start_app.dart';

void main() async {
  //NetworkStatus status = await NetworkChecker.getNetworkStatus();
  setupgetit();
  await ScreenUtil.ensureScreenSize();
  runApp(StartApp());
}

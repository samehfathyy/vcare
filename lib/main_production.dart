import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/core/start_app.dart';

void main() async{
  setupgetit();
    await ScreenUtil.ensureScreenSize();
  runApp(const StartApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';

Future<void> appDialog(
    {required BuildContext context,
    required String title,
    required bool alertdialog,
    required Icon? icon}) async {
  FocusScope.of(context).unfocus();
  bool dismissed = false;
  final dialog = showDialog(
    context: context,
    barrierDismissible: alertdialog,
    builder: (context) {
      return GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity != null &&
              details.primaryVelocity! > 600 &&
              alertdialog) {
            dismissed = true;
            Navigator.of(context).pop();
          }
        },
        child: Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: const BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                alertdialog
                    ? Icon(
                        Icons.drag_handle_rounded,
                        size: 28.sp,
                        color: AppColors.darkgray,
                      )
                    : SizedBox(
                        height: 10.h,
                      ),
                SizedBox(height: 10.h),
                alertdialog
                    ? icon!
                    : Text(
                        title,
                        style: TextStyles.font16dark,
                      ),
                SizedBox(height: alertdialog ? 10.h : 25.h),
                alertdialog
                    ? Text(
                        title,
                        style: TextStyles.font16dark,
                      )
                    : const CircularProgressIndicator(
                        color: AppColors.mainblue,
                      ),
              ],
            ),
          ),
        ),
      );
    },
  );

  if (alertdialog) {
    // Ensure the dialog is shown before dismissing
    Future.delayed(const Duration(seconds: 4), () {
      if (Navigator.canPop(context) && !dismissed) {
        Navigator.of(context).pop();
      }
    });
  }

  return dialog; // Return the dialog future to the caller
}

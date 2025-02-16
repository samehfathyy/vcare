import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/networking/check%20internet/cubit/check_internet_cubit.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';

Future<void> showcheckdialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.all(0),
        backgroundColor: AppColors.white,
        child: Container(
          width: double.infinity,
          height: 400.h,
          decoration: const BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              BlocConsumer<CheckInternetCubit, CheckInternetState>(
                listener: (context, state) {
                  if (state is CheckInternetSuccess) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  if (state is CheckInternetLoading) {
                    return Column(
                      children: [
                        const CircularProgressIndicator(),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          'connecting to internet...',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  return Column(
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
                  );
                },
              ),

              SizedBox(
                height: 10.h,
              ),
              /////////
              TextButton(
                onPressed: () async {
                  await context.read<CheckInternetCubit>().checkinternet();
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.mainblue,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h)),
                child: Text(
                  'Try again',
                  style: TextStyles.font16light,
                ),
              ),
              ///////////
            ],
          ),
        ),
      );
    },
  );
}

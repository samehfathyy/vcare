import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/app_sizes.dart';
import 'package:vcare/core/theming/textstyles.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  bool isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? autofocus;
  final Widget? preFixIcon;
  final TextInputType? textInputType;
  final FocusNode? focusnode;
  AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.autofocus,
    this.preFixIcon,
    this.textInputType,
    this.focusnode,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 14;
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusnode,
      keyboardType: widget.textInputType ?? TextInputType.text,
      autofocus: widget.autofocus ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.preFixIcon,
        errorMaxLines: 3,
        errorStyle: TextStyle(
          fontSize: 14.sp,
        ),
        alignLabelWithHint: false,
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.gray,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        hintStyle: widget.hintStyle ?? TextStyles.textformfont,
        hintText: widget.hintText,
        suffixIcon: widget.isObscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: isObscureText
                    ? Icon(
                        Icons.visibility_off,
                        size: 20.sp,
                      )
                    : Icon(
                        Icons.visibility,
                        size: 20.sp,
                      ))
            : const SizedBox(),
        fillColor: widget.backgroundColor ?? AppColors.white,
        filled: true,
      ),
      obscureText: widget.isObscureText ? isObscureText : false,
      style: TextStyles.font16dark,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return widget.validator(value);
      },
    );
  }
}

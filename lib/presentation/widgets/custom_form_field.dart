import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      this.controller,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.validator,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.maxLines,
      this.minLines,
      this.initialValue,
      this.readOnly,
      this.border,
      this.fillColor,
      this.filled,
      this.errorBorder,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.disabledBorder,
      this.enabledBorder});
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final String? initialValue;
  final bool? readOnly;
  final InputBorder? border;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 368.w,
      // height: 50.h,
      child: TextFormField(
        initialValue: initialValue,
        style: TextStyle(color: Colors.black, fontSize: 14.sp),
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 14.sp * 4),
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        readOnly: readOnly ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          isDense: true,
          suffixIconConstraints: BoxConstraints.tightForFinite(width: 50.h),
          prefixIconConstraints: BoxConstraints.tightForFinite(width: 50.h),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          errorStyle: TextStyle(fontSize: 14.sp),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          // enabled: readOnly ?? true,
          border: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r),
              ),
          filled: filled ?? true,
          fillColor: fillColor ?? const Color(0xFFF0F0F0),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xffBDBDBD),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
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
  });
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
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
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints.tightForFinite(width: 50.h),
          prefixIconConstraints: BoxConstraints.tightForFinite(width: 50.h),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
          filled: filled ?? true,
          fillColor: fillColor ?? const Color(0xffE8E8E8),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffBDBDBD),
          ),
        ),
      ),
    );
  }
}

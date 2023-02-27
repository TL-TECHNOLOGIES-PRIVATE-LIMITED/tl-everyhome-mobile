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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TextFormField(
          style: TextStyle(color: Colors.black, fontSize: 14.sp),
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints.tightForFinite(width: 50.h),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: InputBorder.none,
            filled: true,
            fillColor: const Color(0xffE8E8E8),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffBDBDBD),
            ),
          ),
        ),
      ),
    );
  }
}

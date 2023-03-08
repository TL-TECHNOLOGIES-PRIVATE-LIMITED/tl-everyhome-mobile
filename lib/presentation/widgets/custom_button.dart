import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomYellowButton extends StatelessWidget {
  const CustomYellowButton({
    super.key,
    required this.label,
    this.bgColor,
    this.labelColor,
    this.onPress,
    this.fontSize,
  });
  final String label;
  final Color? bgColor;
  final Color? labelColor;
  final void Function()? onPress;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: Size(350.w, 55.h),
        backgroundColor: bgColor ?? const Color(0xffFEBA45),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 24.sp,
          fontWeight: FontWeight.w500,
          color: labelColor ?? const Color(0xffFFFFFF),
        ),
      ),
    );
  }
}

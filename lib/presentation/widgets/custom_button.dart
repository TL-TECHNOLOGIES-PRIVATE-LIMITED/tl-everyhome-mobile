import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomYellowButton extends StatelessWidget {
  const CustomYellowButton({
    super.key,
    required this.label,
    required this.bgColor,
    required this.labelColor,
    this.onPress,
  });
  final String label;
  final Color bgColor;
  final Color labelColor;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: Size(350.w, 55.h),
        backgroundColor: bgColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: labelColor,
        ),
      ),
    );
  }
}

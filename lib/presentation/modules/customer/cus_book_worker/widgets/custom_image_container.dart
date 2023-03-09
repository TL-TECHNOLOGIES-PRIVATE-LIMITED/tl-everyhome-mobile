import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 85.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffDEDEDE),
            ),
            child: const Center(
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 85.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffDEDEDE),
            ),
            child: const Center(
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 85.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffDEDEDE),
            ),
            child: const Center(
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 85.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffDEDEDE),
            ),
            child: const Center(
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

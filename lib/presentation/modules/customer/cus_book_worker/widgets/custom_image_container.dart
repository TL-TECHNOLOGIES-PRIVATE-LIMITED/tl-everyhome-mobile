
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 80.w,
            height: 80.h,
            color: Colors.amber,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 80.w,
            height: 80.h,
            color: Colors.amber,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 80.w,
            height: 80.h,
            color: Colors.amber[50],
            child: const Center(
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

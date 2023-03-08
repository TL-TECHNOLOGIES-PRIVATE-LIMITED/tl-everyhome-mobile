import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEnaWorkersImages extends StatelessWidget {
  const CustomEnaWorkersImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 136.h,
              width: 129.w,
              color: Colors.amber,
              // child: Image.asset(
              //   'assets/user/image1.png',
              //   width: 120,
              // ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 136.h,
              width: 129.w,
              color: Colors.amber,
              // child: Image.asset(
              //   'assets/user/image1.png',
              //   width: 120,
              // ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 136.h,
              width: 129.w,
              color: Colors.amber,
              // child: Image.asset(
              //   'assets/user/image1.png',
              //   width: 120,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

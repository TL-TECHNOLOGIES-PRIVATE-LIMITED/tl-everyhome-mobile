
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWalletContainer extends StatelessWidget {
  const CustomWalletContainer({
    super.key,
    required this.cardName,
    required this.count,
  });
  final String cardName;
  final String count;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 45.h,
        // width: 180.w,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wallet, color: Colors.black),
            SizedBox(width: 10.w),
            Text(
              cardName,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              count,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

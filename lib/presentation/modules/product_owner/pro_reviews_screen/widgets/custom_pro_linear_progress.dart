
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomProLinearProgress extends StatelessWidget {
  const CustomProLinearProgress({
    super.key,
    required this.progress,
    required this.rating,
    required this.ratingCount,
  });
  final double progress;
  final String rating;
  final String ratingCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Center(
        child: Wrap(
          spacing: 8.w,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              rating,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.white,
              size: 16.r,
            ),
            SizedBox(
              width: 243.w,
              child: LinearPercentIndicator(
                progressColor: const Color(0xffFDBB12),
                percent: progress,
              ),
            ),
            Text(
              ratingCount,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

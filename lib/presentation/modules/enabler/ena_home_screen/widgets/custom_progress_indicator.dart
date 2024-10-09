import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomProgresIndicator extends StatelessWidget {
  const CustomProgresIndicator({
    super.key,
    required this.cardName,
    required this.count,
    required this.percentage,
  });
  final String cardName;
  final String count;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        height: 110.h,
        width: 120.w,
        color: Colors.white,
        child: Center(
          child: CircularPercentIndicator(
            radius: 45.0.r,
            lineWidth: 5.0,
            percent: percentage,
            center: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  count,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cardName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            progressColor: const Color(0xffFFB342),
          ),
        ),
      ),
    );
  }
}

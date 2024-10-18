import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRangeSliderContainer extends StatelessWidget {
  final ValueNotifier<RangeValues> rangeValueNotifier;

  const CustomRangeSliderContainer({
    super.key,
    required this.rangeValueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ValueListenableBuilder<RangeValues>(
          valueListenable: rangeValueNotifier,
          builder: (context, value, _) {
            return Container(
              width: 400.w,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 5,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RangeSlider(
                    values: value,
                    divisions: 10,
                    inactiveColor: const Color(0xffC4C4C4),
                    activeColor: const Color(0xff84E36C),
                    max: 1000,
                    min: 500,
                    labels: RangeLabels(value.start.round().toString(),
                        value.end.round().toString()),
                    onChanged: (newValue) {
                      rangeValueNotifier.value = newValue;
                      log(newValue.toString());
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Text(
                          value.start.round().toString(),
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          value.end.round().toString(),
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

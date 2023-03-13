import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ValueNotifier<RangeValues> rangeValueNotifier =
    ValueNotifier(const RangeValues(500, 1000));

class CustomProRangeSliderContainer extends StatelessWidget {
  CustomProRangeSliderContainer({
    super.key,
  });
  final TextEditingController maxController = TextEditingController();
  final TextEditingController minController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ValueListenableBuilder(
          valueListenable: rangeValueNotifier,
          builder: (context, value, _) {
            maxController.text = value.end.round().toString();
            minController.text = value.start.round().toString();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
                  child: Row(
                    // crossAxisAlignment: WrapCrossAlignment.end,
                    // spacing: 5,
                    children: [
                      Text(
                        'Min',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 76,
                        height: 28.h,
                        child: TextFormField(
                          // initialValue: value.end.round().toString(),
                          controller: minController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              )
                              // fillColor: Colors.black,
                              ),
                        ),
                      ),
                      SizedBox(width: 25.w),
                      Text(
                        'Max',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 76,
                        height: 28.h,
                        child: TextFormField(
                          controller: maxController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              )
                              // fillColor: Colors.black,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                RangeSlider(
                  values: rangeValueNotifier.value,
                  divisions: 10,
                  inactiveColor: const Color(0xffC4C4C4),
                  activeColor: const Color(0xff84E36C),
                  max: 1000,
                  min: 500,
                  labels: RangeLabels(value.start.round().toString(),
                      value.end.round().toString()),
                  onChanged: (value) {
                    rangeValueNotifier.value = value;
                    log(value.toString());
                  },
                ),
              ],
            );
          }),
    );
  }
}

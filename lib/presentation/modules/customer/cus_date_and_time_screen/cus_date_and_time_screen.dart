import 'dart:developer';

import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusDateAndTimeScreen extends StatelessWidget {
  CusDateAndTimeScreen({super.key});
  final today = DateUtils.dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Select Date & Time'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              selectedDayHighlightColor: const Color(0xffFEBA45),
            ),
            initialValue: [
              DateTime.now(),
            ],
            onValueChanged: (value) {
              log(value.toString(), name: 'value changed');
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 20.h),
            child: Text(
              'Available timings',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff232830),
              ),
            ),
          ),
          // TimeRange(
          //   timeBlock: 00,
          //   onRangeCompleted: (range) {},
          //   firstTime: const TimeOfDay(hour: 14, minute: 30),
          //   lastTime: const TimeOfDay(hour: 20, minute: 00),
          // ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
        child: CustomYellowButton(
          label: 'Continue',
          bgColor: const Color(0xffFFA610),
          labelColor: const Color(0xff000000),
          onPress: () {
            //TODO book worker authentication
            // log(cusAddressContoller.text.toString());
            Navigator.of(context).pushNamed('/cus_pick_price_range');
          },
        ),
      ),
    );
  }
}

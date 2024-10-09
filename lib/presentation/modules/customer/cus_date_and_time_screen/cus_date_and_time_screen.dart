import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:every_home/const.dart';
import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusDateAndTimeScreen extends StatelessWidget {
  CusDateAndTimeScreen({super.key});
  final today = DateUtils.dateOnly(DateTime.now());

  // Use a ValueNotifier to manage the selected time
  final ValueNotifier<String?> selectedTimeNotifier =
      ValueNotifier<String?>(null);

  final List<String> availableTimings = [
    '9:00 am',
    '10:00 am',
    '11:00 am',
    '12:00 pm',
    '1:00 pm',
    '2:00 pm',
    '3:00 pm',
    '4:00 pm',
    '5:00 pm'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Select Date & Time',
          style: Appbartextstyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              selectedDayHighlightColor: LigthColor().buttonColorYellow,
            ),
            onValueChanged: (value) {
              log(value.toString(), name: 'value changed');
            },
            value: [],
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w),
            child: Text(
              'Available timings',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff232830),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: ValueListenableBuilder<String?>(
              valueListenable: selectedTimeNotifier,
              builder: (context, selectedTime, _) {
                return Wrap(
                  alignment: WrapAlignment.spaceAround,
                  runSpacing: 7,
                  spacing: 10,
                  children: availableTimings.map((time) {
                    return ChoiceChip(
                      selected: selectedTime == time,
                      selectedColor: LigthColor().buttonColorYellow,
                      onSelected: (selected) {
                        if (selected) {
                          selectedTimeNotifier.value = time;
                        }
                      },
                      label: SizedBox(
                        width: 60,
                        child: Text(time, textAlign: TextAlign.center),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
        child: CustomYellowButton(
          label: 'Continue',
          bgColor: const Color(0xffFFA610),
          labelColor: Colors.white,
          onPress: () {
            // Get selected time
            log('Selected time: ${selectedTimeNotifier.value}');
            // Navigate or perform booking logic
            Navigator.of(context).pushNamed('/cus_pick_price_range');
          },
        ),
      ),
    );
  }
}

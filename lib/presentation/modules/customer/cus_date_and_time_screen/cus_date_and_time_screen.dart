import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              runSpacing: 8,
              spacing: 10,
              children:
                  // controller.timings
                  //     .map(
                  //       (e) =>
                  [
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: true,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('10:00 am', textAlign: TextAlign.center)),
                ),
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: false,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('11:00 am', textAlign: TextAlign.center)),
                ),
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: false,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('12:00 am', textAlign: TextAlign.center)),
                ),
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: false,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('1:00 pm', textAlign: TextAlign.center)),
                ),
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: false,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('2:00 pm', textAlign: TextAlign.center)),
                ),
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: false,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('3:00 pm', textAlign: TextAlign.center)),
                ),
                ChoiceChip(
                  // selected: controller.selTime.value == e.timing,
                  selected: false,
                  selectedColor: LigthColor().buttonColorYellow,
                  onSelected: (val) {
                    // controller.selTime.value = e.timing;
                    // controller.update();
                  },
                  label: const SizedBox(
                      width: 60,
                      child: Text('4:00 pm', textAlign: TextAlign.center)),
                ),
              ],

              // .toList(),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
        child: CustomYellowButton(
          label: 'Continue',
          bgColor: const Color(0xffFFA610),
          labelColor: Colors.white,
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

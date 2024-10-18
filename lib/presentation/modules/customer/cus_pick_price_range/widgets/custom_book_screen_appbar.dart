import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_form_field.dart';
import 'custom_cus_Filter_chip.dart';
import 'custom_range_slider_container.dart';

class CustomBookScreenAppBar extends StatelessWidget {
  const CustomBookScreenAppBar({
    super.key,
    required ValueNotifier<int> indexNotifier,
  }) : _indexNotifier = indexNotifier;

  final ValueNotifier<int> _indexNotifier;

  @override
  Widget build(BuildContext context) {
    // Create ValueNotifiers for tracking selected filters
    final ValueNotifier<int?> rateNotifier = ValueNotifier<int?>(null);
    final ValueNotifier<int?> distanceNotifier = ValueNotifier<int?>(null);
    final ValueNotifier<RangeValues> rangeValueNotifier =
        ValueNotifier<RangeValues>(const RangeValues(500, 1000));

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff22262B),
                    Color(0xFF252E39),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).viewPadding.top),
                    SizedBox(
                      width: 1.sw,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Select Price ',
                              style: TextStyle(
                                color: const Color(0xffFFFDFD),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 3,
                      color: Colors.black38,
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 55.h,
                              child: CustomFormField(
                                  prefixIcon: Icon(
                                    IconlyLight.search,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Search your Requirements'),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (ctx) {
                                  return SizedBox(
                                    height:
                                        MediaQuery.of(ctx).size.height * 0.62,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20.h, 24.w, 20.h, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: const Icon(
                                                      Icons.arrow_back_ios_new),
                                                ),
                                                const Text('Filter'),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Reset the filters
                                                    rateNotifier.value = null;
                                                    distanceNotifier.value =
                                                        null;
                                                    rangeValueNotifier.value =
                                                        const RangeValues(
                                                            500, 1000);
                                                  },
                                                  child: const Text('Reset'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: CustomRangeSliderContainer(
                                              rangeValueNotifier:
                                                  rangeValueNotifier,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          CustomCusFilterChip(
                                            type: 'rate',
                                            selectedIndexNotifier: rateNotifier,
                                          ),
                                          SizedBox(height: 5.h),
                                          CustomCusFilterChip(
                                            type: 'dist',
                                            selectedIndexNotifier:
                                                distanceNotifier,
                                          ),
                                          SizedBox(height: 15.h),
                                          Center(
                                            child: CustomYellowButton(
                                              label: 'Filter',
                                              onPress: () {
                                                // Apply filters
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 24.h),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 55.h,
                                width: 55.w,
                                color: Colors.white,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/filter_icon.svg',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
              valueListenable: _indexNotifier,
              builder: (context, newIndex, _) {
                return MaterialSegmentedControl(
                  verticalOffset: 10.w,
                  horizontalPadding: const EdgeInsets.all(8),
                  borderWidth: 1,
                  selectedColor: const Color(0xffFEBA45),
                  onSegmentTapped: (value) {
                    _indexNotifier.value = value;
                  },
                  unselectedColor: const Color(0xffE9E9E9),
                  unselectedTextStyle: TextStyle(
                      color: const Color(0xff727272), fontSize: 14.sp),
                  selectedTextStyle: TextStyle(
                      color: const Color(0xff252C35), fontSize: 14.sp),
                  selectionIndex: newIndex,
                  children: {
                    0: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: const Text('Choose Enabler')),
                    1: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Text('Nearby Shops')),
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

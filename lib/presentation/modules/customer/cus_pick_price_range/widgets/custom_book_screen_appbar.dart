import 'package:every_home/presentation/modules/customer/cus_pick_price_range/widgets/custom_range_slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CustomBookScreenAppBar extends StatelessWidget {
  const CustomBookScreenAppBar({
    super.key,
    required ValueNotifier<int> indexNotifier,
  }) : _indexNotifier = indexNotifier;

  final ValueNotifier<int> _indexNotifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Container(
              // height: 340.h,
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
                          Expanded(child: CustomRangeSliderContainer()),
                          // SizedBox(width: 10.w),
                          // GestureDetector(
                          //   onTap: () {
                          //     showModalBottomSheet(
                          //         context: context,
                          //         backgroundColor: Colors.transparent,
                          //         builder: (ctx) {
                          //           return Container(
                          //             // height: 551.h,
                          //             width: double.infinity,
                          //             decoration: BoxDecoration(
                          //               color: Colors.white,
                          //               borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(20.r),
                          //                 topRight: Radius.circular(20.r),
                          //               ),
                          //             ),
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 Center(
                          //                     child:
                          //                         CustomRangeSliderContainer()),
                          //                 SizedBox(height: 18.h),
                          //                 const CustomCusFilterChip(),
                          //                 SizedBox(height: 12.h),
                          //                 const CustomCusFilterChip(),
                          //                 SizedBox(height: 33.h),
                          //                 Center(
                          //                   child: CustomYellowButton(
                          //                     label: 'Filter',
                          //                     onPress: () {},
                          //                   ),
                          //                 ),
                          //                 SizedBox(height: 24.h),
                          //               ],
                          //             ),
                          //           );
                          //         });
                          //   },
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(8),
                          //     child: Container(
                          //       height: 55.h,
                          //       width: 55.w,
                          //       color: Colors.white,
                          //       child: Center(
                          //         child: SvgPicture.asset(
                          //           'assets/icons/filter_icon.svg',
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
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

class CustomCusFilterChip extends StatelessWidget {
  const CustomCusFilterChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Ratings',
            style: TextStyle(
              color: const Color(0xff252C35),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 8,
            spacing: 10,
            children: [
              ChoiceChip(
                shape: const RoundedRectangleBorder(),
                label: Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '5-4',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.black)
                  ],
                ),
                selected: true,
              ),
              ChoiceChip(
                shape: const RoundedRectangleBorder(),
                label: Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '4-3',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.black)
                  ],
                ),
                selected: true,
              ),
              ChoiceChip(
                shape: const RoundedRectangleBorder(),
                label: Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '3-2',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.black)
                  ],
                ),
                selected: true,
              ),
              ChoiceChip(
                labelStyle: const TextStyle(color: Colors.black),
                shape: const RoundedRectangleBorder(),
                label: Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '2-1',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.black)
                  ],
                ),
                selected: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:every_home/presentation/modules/customer/cus_pick_price_range/enabler_list.dart';
import 'package:every_home/presentation/modules/customer/cus_pick_price_range/near_by_shops_list.dart';
import 'package:every_home/presentation/modules/customer/cus_pick_price_range/widgets/custom_book_screen_appbar.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

final ValueNotifier<RangeValues> rangeValueNotifier =
    ValueNotifier(const RangeValues(500, 1000));

class CusPickPriceRange extends StatelessWidget {
  CusPickPriceRange({super.key});

  final ValueNotifier<int> _indexNotifier = ValueNotifier(0);
  final List<Widget> _pages = [
    const EnablerList(),
    const NearByShopsList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios_new_outlined,
      //         color: Colors.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: const Text('Select Price Range'),
      //   elevation: 0,
      //   bottom: AppBar(
      //     automaticallyImplyLeading: false,
      //     centerTitle: true,
      //     toolbarHeight: 150.h,
      //     // title: CustomRangeSliderContainer(),
      //   ),
      // ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBookScreenAppBar(indexNotifier: _indexNotifier),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _indexNotifier,
              builder: (context, newIndex, _) {
                return _pages[newIndex];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
        child: CustomYellowButton(
          label: 'Send Request',
          bgColor: const Color(0xffFFA610),
          labelColor: Colors.white,
          onPress: () {
            //TODO book worker authentication
            // log(cusAddressContoller.text.toString());
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Your request has submitted succesfully',
                confirmBtnColor: const Color(0xffFEBA45),
                autoCloseDuration: const Duration(seconds: 5),
                onConfirmBtnTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/cus_main_screen', (route) => false);
                });
          },
        ),
      ),
    );
  }
}

class CustomRangeSliderContainer extends StatelessWidget {
  const CustomRangeSliderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ValueListenableBuilder(
          valueListenable: rangeValueNotifier,
          builder: (context, value, _) {
            return Container(
              width: 355.w,
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
                          'Amount',
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Avrg per day',
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              ),
            );
          }),
    );
  }
}



// ValueListenableBuilder(
//         valueListenable: _indexNotifier,
//         builder: (context, newIndex, _) {
//           return SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Center(
//                   child: MaterialSegmentedControl(
//                     verticalOffset: 10.w,
//                     horizontalPadding: const EdgeInsets.all(10),
//                     borderWidth: 1,
//                     selectedColor: Colors.white,
//                     onSegmentTapped: (value) {
//                       _indexNotifier.value = value;
//                     },
//                     unselectedColor: const Color(0xffE9E9E9),
//                     unselectedTextStyle:
//                         const TextStyle(color: Color(0xff727272)),
//                     selectedTextStyle:
//                         const TextStyle(color: Color(0xff252C35)),
//                     selectionIndex: newIndex,
//                     children: {
//                       0: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 25.h),
//                           child: const Text('Choose Enabler')),
//                       1: const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Text('Nearby Shops')),
//                     },
//                   ),
//                 ),
//                 _pages[newIndex],
//               ],
//             ),
//           );
//         },
//       ),
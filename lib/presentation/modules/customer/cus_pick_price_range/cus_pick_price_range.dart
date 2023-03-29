import 'package:every_home/presentation/modules/customer/cus_pick_price_range/enabler_list.dart';
import 'package:every_home/presentation/modules/customer/cus_pick_price_range/near_by_shops_list.dart';
import 'package:every_home/presentation/modules/customer/cus_pick_price_range/widgets/custom_book_screen_appbar.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

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
              },
            );
          },
        ),
      ),
    );
  }
}

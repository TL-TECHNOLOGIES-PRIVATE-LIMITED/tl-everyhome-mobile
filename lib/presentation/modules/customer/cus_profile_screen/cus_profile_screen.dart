import 'package:every_home/domain/dummy/models/dummy_customer_model.dart';
import 'package:every_home/presentation/modules/customer/cus_profile_screen/widgets/custom_account_section.dart';
import 'package:every_home/presentation/modules/customer/cus_profile_screen/widgets/custom_profile_container.dart';
import 'package:every_home/presentation/modules/customer/cus_profile_screen/widgets/custom_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class CusProfileScreen extends StatelessWidget {
  const CusProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO customer details recieving
    final args = ModalRoute.of(context)!.settings.arguments as DummyCustomer;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO customer details passing to customProfileContainer
            CustomProfileContainer(
              customerName: args.name.toString(),
              customerProfilePic: args.profilePic.toString(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 24, bottom: 16),
              child: Text(
                'Select or Add Account',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const CustomAccountSection(),
            const CustomProfileTile(
              title: 'My Earnings',
              icon: IconlyLight.wallet,
            ),
            const CustomProfileTile(
              title: 'My Address',
              icon: IconlyLight.discovery,
            ),
            const CustomProfileTile(
              title: 'Support',
              icon: IconlyLight.info_circle,
            ),
            const CustomProfileTile(
              title: 'FAQ',
              icon: IconlyLight.shield_done,
            ),
            const CustomProfileTile(
              title: 'Refer & Earn',
              icon: IconlyLight.chat,
            ),
            const CustomProfileTile(
              title: 'Logout',
              icon: IconlyLight.logout,
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}

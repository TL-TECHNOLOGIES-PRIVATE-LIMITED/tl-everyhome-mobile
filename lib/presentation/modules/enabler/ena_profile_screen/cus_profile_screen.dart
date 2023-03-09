import 'package:every_home/presentation/modules/enabler/ena_profile_screen/widgets/custom_account_section.dart';
import 'package:every_home/presentation/modules/enabler/ena_profile_screen/widgets/custom_profile_container.dart';
import 'package:every_home/presentation/modules/enabler/ena_profile_screen/widgets/custom_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class EnaProfileScreen extends StatelessWidget {
  const EnaProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO customer details recieving
    // final args = ModalRoute.of(context)!.settings.arguments as DummyCustomer;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO customer details passing to customProfileContainer
            const CustomEnaProfileContainer(
              customerName: 'Finose M',
              customerProfilePic: "",
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
            const CustomEnaAccountSection(),
            const CustomEnaProfileTile(
              title: 'My Earnings',
              icon: IconlyLight.wallet,
            ),
            const CustomEnaProfileTile(
              title: 'My Address',
              icon: IconlyLight.discovery,
            ),
            const CustomEnaProfileTile(
              title: 'Support',
              icon: IconlyLight.info_circle,
            ),
            const CustomEnaProfileTile(
              title: 'FAQ',
              icon: IconlyLight.shield_done,
            ),
            const CustomEnaProfileTile(
              title: 'Refer & Earn',
              icon: IconlyLight.chat,
            ),
            const CustomEnaProfileTile(
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

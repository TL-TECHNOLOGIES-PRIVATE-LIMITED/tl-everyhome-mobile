import 'package:every_home/presentation/modules/product_owner/pro_profile_screen/widgets/custom_account_section.dart';
import 'package:every_home/presentation/modules/product_owner/pro_profile_screen/widgets/custom_profile_container.dart';
import 'package:every_home/presentation/modules/product_owner/pro_profile_screen/widgets/custom_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class ProProfileScreen extends StatelessWidget {
  const ProProfileScreen({super.key});

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
            const CustomProProfileContainer(
              customerName: 'Hamdan L',
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
            const CustomProAccountSection(),
            const CustomProProfileTile(
              title: 'My Earnings',
              icon: IconlyLight.wallet,
            ),
            const CustomProProfileTile(
              title: 'My Address',
              icon: IconlyLight.discovery,
            ),
            const CustomProProfileTile(
              title: 'Support',
              icon: IconlyLight.info_circle,
            ),
            const CustomProProfileTile(
              title: 'FAQ',
              icon: IconlyLight.shield_done,
            ),
            const CustomProProfileTile(
              title: 'Refer & Earn',
              icon: IconlyLight.chat,
            ),
            const CustomProProfileTile(
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

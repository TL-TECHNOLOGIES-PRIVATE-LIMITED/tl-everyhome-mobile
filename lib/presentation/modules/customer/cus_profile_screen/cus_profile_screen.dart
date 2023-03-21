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
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: const Text(
                          'Comming soon',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('close'),
                          )
                        ],
                      );
                    });
              },
              child: const CustomProfileTile(
                title: 'My Earnings',
                icon: IconlyLight.wallet,
              ),
            ),
            const CustomProfileTile(
              title: 'My Address',
              icon: IconlyLight.discovery,
            ),
            GestureDetector(
              onTap: () {
                customBottomSheet(context);
              },
              child: const CustomProfileTile(
                title: 'Support',
                icon: IconlyLight.info_circle,
              ),
            ),
            const CustomProfileTile(
              title: 'FAQ',
              icon: IconlyLight.shield_done,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: const Text(
                          'Comming soon',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('close'),
                          )
                        ],
                      );
                    });
              },
              child: const CustomProfileTile(
                title: 'Refer & Earn',
                icon: IconlyLight.chat,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text(
                          'Are you sure you want to continue?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     '/signin_screen', (route) => false);
                            },
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                color: Colors.red,
                              ),
                              enableFeedback: true,
                            ),
                            child: const Text('Logout'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    });
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     '/signin_screen', (route) => false);
              },
              child: const CustomProfileTile(
                title: 'Logout',
                icon: IconlyLight.logout,
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

// Terms and conditions, Privacy policies documents
  Future<dynamic> customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ClipRRect(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff22262B),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.contact_support_outlined),
                      title: Text(
                        'Terms And Conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/terms_and_conditions');
                      },
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.privacy_tip),
                      title: Text(
                        'Privacy Policies',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/privacy_policy');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:every_home/presentation/modules/enabler/ena_home_screen/widgets/custom_progress_indicator.dart';
import 'package:every_home/presentation/modules/enabler/ena_home_screen/widgets/custom_wallet_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: const Color(0xff22262B),
      elevation: 0,
      title: Column(
        children: [
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/create_profile_screen');
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(''),
                  ),
                ),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 5,
                  ),
                )
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                children: const [
                  Text(
                    'Samuel John',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 12,
                    child: Icon(
                      Icons.expand_more,
                      size: 25,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            subtitle: Wrap(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Color(0xffFEBA45),
                  size: 17,
                ),
                Text(
                  'Trivandrum,palayam',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/ena_notification_screen');
              },
              icon: const Icon(Icons.notification_add),
            ),
          ),
        ],
      ),
      bottom: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 180.h,
        backgroundColor: const Color(0xff22262B),
        title: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomProgresIndicator(
                  cardName: 'Active',
                  count: '01',
                  percentage: 0.9,
                ),
                CustomProgresIndicator(
                  cardName: 'Pending',
                  count: '02',
                  percentage: 0.8,
                ),
                CustomProgresIndicator(
                  cardName: 'Completed',
                  count: '10',
                  percentage: 0.4,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomWalletContainer(
                  cardName: 'Earned',
                  count: '6000',
                ),
                CustomWalletContainer(
                  cardName: 'Feedbacks',
                  count: '12',
                ),
              ],
            ),
          )
        ]),
      ),
      // expandedHeight: 300.h,
      // flexibleSpace: const FlexibleSpaceBar(title: Divider()),
    );
  }
}

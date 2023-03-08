import 'package:every_home/presentation/notification_screen/widgets/notification_view_all_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaNotificationScreen extends StatelessWidget {
  const EnaNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification (1)'),
      ),
      body: ListView(
        children: [
          NotificationViewAllBadge(
            searchTitle: 'Today',
            viewAll: 'View all',
            onPress: () {},
          ),
          ListTile(
            leading: const CircleAvatar(),
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Electrician',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              'Accepts your Bookings Request,and Negotiate the Amount to 700',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

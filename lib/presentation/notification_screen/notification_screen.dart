import 'package:every_home/presentation/notification_screen/widgets/notification_view_all_badge.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
          const ListTile(
            leading: CircleAvatar(),
            title: Text(
              'Electrician Accepts your Bookings Request,and Negotiate the Amount to 700',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:every_home/presentation/modules/enabler/ena_notification_screen/widgets/custom_cus_notification_message.dart';
import 'package:every_home/presentation/notification_screen/widgets/notification_view_all_badge.dart';
import 'package:flutter/material.dart';

class EnaNotificationScreen extends StatelessWidget {
  const EnaNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification (4)'),
      ),
      body: ListView(
        children: [
          NotificationViewAllBadge(
            searchTitle: 'Today',
            viewAll: 'View all',
            onPress: () {},
          ),
          const CustomCusNotificationMessage(
            name: 'Electrician',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: 'Today',
          ),
          const Divider(),
          const CustomCusNotificationMessage(
            name: 'Electrician',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: 'Today',
          ),
          const Divider(),
          const CustomCusNotificationMessage(
            name: 'Plumber',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: 'Today',
          ),
          const Divider(),
          NotificationViewAllBadge(
            searchTitle: 'Yesterday',
            viewAll: 'View all',
            onPress: () {},
          ),
          const CustomCusNotificationMessage(
            name: 'Taxi',
            message:
                'Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount ',
            profilePicture: '',
            time: '1 day ago',
          ),
        ],
      ),
    );
  }
}

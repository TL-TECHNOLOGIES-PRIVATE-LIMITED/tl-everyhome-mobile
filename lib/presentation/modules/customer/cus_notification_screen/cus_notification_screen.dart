import 'package:every_home/presentation/modules/customer/cus_notification_screen/widgets/custom_cus_notification_message.dart';
import 'package:every_home/presentation/modules/customer/cus_notification_screen/widgets/custom_cus_notification_view_all_badge.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification (4)'),
      ),
      body: ListView(
        children: [
          CustomCusNotificationViewAllBadge(
            searchTitle: 'Today',
            viewAll: 'View all',
            onPress: () {},
          ),
          const CustomCusNotificationMessage(
            name: 'Electrician',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '3:15pm',
          ),
          const Divider(),
          const CustomCusNotificationMessage(
            name: 'Electrician',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '10:00am',
          ),
          const Divider(),
          const CustomCusNotificationMessage(
            name: 'Plumber',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '11:50am',
          ),
          const Divider(),
          CustomCusNotificationViewAllBadge(
            searchTitle: 'Yesterday',
            viewAll: 'View all',
            onPress: () {},
          ),
          const CustomCusNotificationMessage(
            name: 'Taxi',
            message:
                'Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount ',
            profilePicture: '',
            time: '5:45pm',
          ),
          const Divider(),
          const CustomCusNotificationMessage(
            name: 'Plumber',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '8:00pm',
          ),
        ],
      ),
    );
  }
}

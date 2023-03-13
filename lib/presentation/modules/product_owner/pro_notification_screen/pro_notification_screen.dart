import 'package:every_home/presentation/modules/product_owner/pro_notification_screen/widgets/custom_pro_notification_message.dart';
import 'package:every_home/presentation/modules/product_owner/pro_notification_screen/widgets/custom_pro_notification_view_all_badge.dart';
import 'package:flutter/material.dart';

class ProNotificationScreen extends StatelessWidget {
  const ProNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification (4)'),
      ),
      body: ListView(
        children: [
          CustomProNotificationViewAllBadge(
            searchTitle: 'Today',
            viewAll: 'View all',
            onPress: () {},
          ),
          const CustomProNotificationMessage(
            name: 'Electrician',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '3:15pm',
          ),
          const Divider(),
          const CustomProNotificationMessage(
            name: 'Electrician',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '10:00am',
          ),
          const Divider(),
          const CustomProNotificationMessage(
            name: 'Plumber',
            message: 'Accepts your bookings request,Negotiated amount 700',
            profilePicture: '',
            time: '11:50am',
          ),
          const Divider(),
          CustomProNotificationViewAllBadge(
            searchTitle: 'Yesterday',
            viewAll: 'View all',
            onPress: () {},
          ),
          const CustomProNotificationMessage(
            name: 'Taxi',
            message:
                'Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount 700,Accepts your bookings request,Negotiated amount ',
            profilePicture: '',
            time: '5:45pm',
          ),
          const Divider(),
          const CustomProNotificationMessage(
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

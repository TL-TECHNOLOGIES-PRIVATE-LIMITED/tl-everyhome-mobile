import 'package:every_home/presentation/modules/customer/cus_works_screen/widgets/custom_work_job_card.dart';
import 'package:flutter/material.dart';

class ActiveList extends StatelessWidget {
  const ActiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/cus_worker_rating_screen');
          },
          child: const CustomWorkJobCard(
            image: '',
            jobTitle: 'Celing light repairing',
            jobLocation: 'Ernakkulam, Kakkanad',
            cardType: 'Pending',
            date: '01 oct 2022',
            time: '9:00 AM',
            isActive: true,
            isPending: false,
          ),
        );
      },
    );
  }
}

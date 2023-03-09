import 'package:every_home/presentation/modules/enabler/ena_works_screen/widgets/custom_ena_works_job_tile.dart';
import 'package:flutter/material.dart';

class EnaWorksActiveList extends StatelessWidget {
  const EnaWorksActiveList({super.key});

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
            Navigator.of(context).pushNamed('/ena_work_finish_screen');
          },
          child: const CustomEnaWorkJobTile(
            image: '',
            jobTitle: 'Celing light repairing',
            jobLocation: 'Ernakkulam, Kakkanad',
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

import 'package:every_home/domain/dummy/db_function.dart';
import 'package:every_home/presentation/modules/customer/widgets/custom_job_card.dart';
import 'package:flutter/material.dart';

class EnablerList extends StatelessWidget {
  const EnablerList({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO worker dummy data
    final worker = DBFunction().fetchWorker();
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: worker.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/cus_view_job_card', arguments: worker[index]);
          },
          child: CustomJobCard(
            image: worker[index].profilePic.toString(),
            jobTitle: worker[index].name.toString(),
            jobLocation: worker[index].place.toString(),
            rating: 3.5,
            reviewCount: '6',
          ),
        );
      },
    );
  }
}

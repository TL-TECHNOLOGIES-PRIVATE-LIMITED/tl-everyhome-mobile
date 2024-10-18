import 'package:every_home/domain/dummy/db_function.dart';
import 'package:every_home/presentation/modules/customer/widgets/custom_job_card.dart';
import 'package:flutter/material.dart';

bool isnear = false;

class NearByShopsList extends StatelessWidget {
  const NearByShopsList({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO worker dummy data
    final bussiness = DBFunction().fetchBusiness();
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: bussiness.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            isnear = true;
            Navigator.of(context)
                .pushNamed('/cus_view_job_card', arguments: bussiness[index]);
          },
          child: CustomJobCard(
            image: bussiness[index].profilePic.toString(),
            jobTitle: bussiness[index].name.toString(),
            jobLocation: bussiness[index].place.toString(),
            rating: 3.5,
            reviewCount: '6',
          ),
        );
      },
    );
  }
}

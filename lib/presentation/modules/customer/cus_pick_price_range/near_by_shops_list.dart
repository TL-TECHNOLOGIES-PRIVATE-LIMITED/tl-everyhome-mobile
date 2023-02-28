import 'package:every_home/presentation/modules/customer/cus_pick_price_range/widgets/custom_job_card.dart';
import 'package:flutter/material.dart';

class NearByShopsList extends StatelessWidget {
  const NearByShopsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const CustomJobCard(
          image: '',
          jobTitle: 'Sijo Simon',
          jobLocation: 'Trivandrum, Palayam',
          rating: 3.5,
          reviewCount: '6',
        );
      },
    );
  }
}

import 'package:every_home/presentation/modules/customer/widgets/custom_job_card.dart';
import 'package:flutter/material.dart';

class CusFavouritesScreen extends StatelessWidget {
  const CusFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favourites (20)'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const CustomJobCard(
            image: '',
            jobTitle: 'Sijo Simon',
            jobLocation: 'Kottayam, Changhanasseri',
            rating: 3,
            reviewCount: '10',
            isFavourite: true,
          );
        },
      ),
    );
  }
}

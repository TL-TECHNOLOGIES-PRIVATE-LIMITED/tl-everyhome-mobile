import 'package:every_home/presentation/modules/customer/cus_view_job_card/about_list.dart';
import 'package:every_home/presentation/modules/customer/cus_view_job_card/portfolio_list.dart';
import 'package:every_home/presentation/modules/customer/cus_view_job_card/reviews_list.dart';
import 'package:every_home/presentation/modules/customer/cus_view_job_card/widgets/custom_bottom_button.dart';
import 'package:every_home/presentation/modules/customer/cus_view_job_card/widgets/custom_profile_container.dart';
import 'package:flutter/material.dart';

class CusViewJobCard extends StatelessWidget {
  CusViewJobCard({super.key});

  final ValueNotifier<int> _indexNotifier = ValueNotifier(0);
  final List<Widget> _pages = [
    const AboutList(),
    const ReviewsList(),
    const PortfolioList(),
  ];
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProfileContainer(indexNotifier: _indexNotifier),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _indexNotifier,
              builder: (context, newIndex, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: _pages[newIndex],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomButton(),
    );
  }
}

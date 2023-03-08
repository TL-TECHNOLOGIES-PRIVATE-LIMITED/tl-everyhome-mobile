import 'package:every_home/domain/dummy/models/dummy_worker_model.dart';
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
    const ReviewsList(),
    const AboutList(),
    const PortfolioList(),
  ];
  @override
  Widget build(BuildContext context) {
    //TODO dummy worker
    final args = ModalRoute.of(context)!.settings.arguments as DummyWorker;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProfileContainer(
            indexNotifier: _indexNotifier,
            data: args,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _indexNotifier,
              builder: (context, newIndex, _) {
                return _pages[newIndex];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomButton(),
    );
  }
}

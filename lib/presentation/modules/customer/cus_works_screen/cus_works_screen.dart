import 'package:every_home/presentation/modules/customer/cus_works_screen/active_list.dart';
import 'package:every_home/presentation/modules/customer/cus_works_screen/completed_list.dart';
import 'package:every_home/presentation/modules/customer/cus_works_screen/pending_list.dart';
import 'package:every_home/presentation/modules/customer/cus_works_screen/widgets/custom_appbar_container.dart';
import 'package:flutter/material.dart';

class CusWorksScreeen extends StatelessWidget {
  CusWorksScreeen({super.key});

  final ValueNotifier<int> _indexNotifier = ValueNotifier(0);
  final List<Widget> _pages = [
    const PendingList(),
    const ActiveList(),
    const CompletedList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbarContainer(indexNotifier: _indexNotifier),
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
      // bottomNavigationBar: const CustomBottomButton(),
    );
  }
}

import 'package:every_home/presentation/modules/enabler/ena_works_screen/widgets/custom_ena_works_appbar.dart';
import 'package:flutter/material.dart';

import 'ena_works_active_list.dart';
import 'ena_works_completed_list.dart';
import 'ena_works_pending_list.dart';

class EnaWorksScreen extends StatelessWidget {
  EnaWorksScreen({super.key});
  final ValueNotifier<int> _indexNotifier = ValueNotifier(0);
  final List<Widget> _pages = [
    const EnaWorksPendingList(),
    const EnaWorksActiveList(),
    const EnaWorksCompletedList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomEnaWorksAppBar(
            indexNotifier: _indexNotifier,
            activeCount: '10',
            pendingCount: '2',
            completedCount: '3',
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
      // bottomNavigationBar: const CustomBottomButton(),
    );
  }
}

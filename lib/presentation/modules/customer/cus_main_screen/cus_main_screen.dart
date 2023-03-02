import 'package:every_home/presentation/modules/customer/cus_favourites_screen/cus_favourites_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_main_screen/widgets/custom_bottom_navbar.dart';
import 'package:every_home/presentation/modules/customer/cus_wallet_screen/cus_wallet_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_works_screen/cus_works_screen.dart';
import 'package:every_home/presentation/modules/customer/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class CusMainScreen extends StatelessWidget {
  CusMainScreen({super.key});

  final _cusPages = [
    const CusHomeScreen(),
    CusWorksScreeen(),
    const CusWalletScreen(),
    const CusFavouritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: cusBottomNavIndexNotifier,
        builder: (context, index, _) {
          return _cusPages[index];
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBarCus(),
    );
  }
}

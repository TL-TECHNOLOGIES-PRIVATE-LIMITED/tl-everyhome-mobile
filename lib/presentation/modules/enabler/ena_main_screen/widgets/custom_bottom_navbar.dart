import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

ValueNotifier<int> enaBottomNavIndexNotifier = ValueNotifier(0);

class CustomEnaBottomNavigationBarCus extends StatelessWidget {
  const CustomEnaBottomNavigationBarCus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: enaBottomNavIndexNotifier,
        builder: (context, newIndex, _) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) {
                enaBottomNavIndexNotifier.value = index;
              },
              unselectedItemColor: Colors.white,
              selectedItemColor: LigthColor().textColorYellow,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(IconlyLight.home),
                  label: 'Home',
                  activeIcon: Icon(IconlyBold.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconlyLight.work),
                  label: 'Works',
                  activeIcon: Icon(IconlyBold.work),
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconlyLight.wallet),
                  label: 'Wallet',
                  activeIcon: Icon(IconlyBold.wallet),
                ),
              ],
            ),
          );
        });
  }
}

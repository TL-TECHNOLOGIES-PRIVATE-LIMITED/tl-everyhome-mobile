import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:every_home/domain/core/theme.dart';

ValueNotifier<int> proBottomNavIndexNotifier = ValueNotifier(0);

class CustomProBottomNavigationBarCus extends StatelessWidget {
  const CustomProBottomNavigationBarCus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: proBottomNavIndexNotifier,
        builder: (context, newIndex, _) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) {
                proBottomNavIndexNotifier.value = index;
              },
              unselectedItemColor: Colors.white,
              selectedItemColor: LigthColor().textColorYellow,
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(IconlyBold.home),
                  label: 'Home',
                  activeIcon: Icon(IconlyBold.home),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/bottom_nav/product_icon.svg'),
                  label: 'My Products',
                  activeIcon: SvgPicture.asset(
                      'assets/icons/bottom_nav/product_orange_icon.svg'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/bottom_nav/reviews_icon.svg'),
                  label: 'Reviews',
                  activeIcon: SvgPicture.asset(
                      'assets/icons/bottom_nav/reviews_orange_icon.svg'),
                ),
              ],
            ),
          );
        });
  }
}

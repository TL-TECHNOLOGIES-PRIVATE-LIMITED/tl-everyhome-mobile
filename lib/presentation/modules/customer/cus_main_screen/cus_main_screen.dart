import 'package:every_home/presentation/modules/customer/cus_favourites_screen/cus_favourites_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_main_screen/widgets/custom_bottom_navbar.dart';
import 'package:every_home/presentation/modules/customer/cus_wallet_screen/cus_wallet_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_works_screen/cus_works_screen.dart';
import 'package:every_home/presentation/modules/customer/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CusMainScreen extends StatelessWidget {
  CusMainScreen({super.key});

  final _cusPages = [
    const CusHomeScreen(),
    CusWorksScreeen(),
    const CusWalletScreen(),
    const CusFavouritesScreen(),
  ];
  final bool _canPop = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_canPop) {
          return true;
        } else {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Alert"),
              content: const Text(
                "Are you sure you want to exit?",
                style: TextStyle(color: Colors.black87),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    // setState(() {
                    //   _canPop = true;
                    // });
                    //TODO change navigator while exiting
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');

                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (context) => const SignInScreen()),
                    //     (route) => false);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
          return false;
        }
      },
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: cusBottomNavIndexNotifier,
          builder: (context, index, _) {
            return _cusPages[index];
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBarCus(),
      ),
    );
  }
}

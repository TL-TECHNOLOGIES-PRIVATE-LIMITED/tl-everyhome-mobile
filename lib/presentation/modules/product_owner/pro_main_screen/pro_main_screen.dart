import 'package:every_home/presentation/modules/product_owner/pro_home_screen/pro_home_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_main_screen/widgets/custom_pro_bottom_navbar.dart';
import 'package:every_home/presentation/modules/product_owner/pro_reviews_screen/pro_reviews_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_show_products_screen/pro_show_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProMainScreen extends StatelessWidget {
  ProMainScreen({super.key});

  final _cusPages = [
    const ProHomeScreen(),
    const ProShowProductsScreen(),
    const ProReviewsScreen(),
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
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: ValueListenableBuilder(
            valueListenable: proBottomNavIndexNotifier,
            builder: (context, index, _) {
              return _cusPages[index];
            },
          ),
          bottomNavigationBar: const CustomProBottomNavigationBarCus(),
        ),
      ),
    );
  }
}

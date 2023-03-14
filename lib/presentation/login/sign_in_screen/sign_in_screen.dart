import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/custom_login_container.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: LigthColor().bgColorGrey,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/bg_images/login_screen_bg.png'),
            ),
            CustomLoginContainer(),
          ],
        ),
      ),
    );
  }
}

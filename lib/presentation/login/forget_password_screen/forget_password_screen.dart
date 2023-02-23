import 'package:every_home/presentation/login/forget_password_screen/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/bg_images/otp_screen_bg.png'),
            ),
            Positioned(
              top: 0.12.sh,
              left: 0.1.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(40 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_1.png',
                ),
              ),
            ),
            Positioned(
              top: 0.1.sh,
              right: 0.15.sw,
              child: Image.asset('assets/polygons/polygon_2.png'),
            ),
            Positioned(
              top: 0.4.sh,
              right: 0.25.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(60 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_1.png',
                ),
              ),
            ),
            const CustomContainer()
          ],
        ),
      ),
    );
  }
}

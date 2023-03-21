import 'package:every_home/presentation/modules/login/forget_password_screen/widget/custom_fpassword_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Positioned(
              top: 0.1.sh,
              left: 0.1.sw,
              child: SvgPicture.asset('assets/polygons/background_ring.svg'),
            ),
            Positioned(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/bg_images/forget_password_screen_bg.png',
                  width: 100,
                  height: 0.5.sh,
                ),
              ),
            ),
            //orange triangle
            Positioned(
              top: 0.17.sh,
              left: 0.1.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(40 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_1.png',
                ),
              ),
            ),
            //black circle
            Positioned(
              top: 0.15.sh,
              right: 0.17.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(40 / 360),
                child: Image.asset(
                  'assets/polygons/Ellipse_1.png',
                ),
              ),
            ),
            //Black Circle
            Positioned(
              top: 0.3.sh,
              left: 0.07.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(40 / 360),
                child: Image.asset(
                  'assets/polygons/Ellipse_1.png',
                ),
              ),
            ),
            //Blue traingle
            Positioned(
              top: 0.08.sh,
              left: 0.17.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(40 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_2.png',
                ),
              ),
            ),
            //Blue Triangle
            Positioned(
              top: 0.45.sh,
              left: 0.1.sw,
              child: Image.asset('assets/polygons/polygon_2.png'),
            ),
            Positioned(
              top: 0.4.sh,
              right: 0.17.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(60 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_1.png',
                ),
              ),
            ),
            CustomForgotPasswordContainer()
          ],
        ),
      ),
    );
  }
}

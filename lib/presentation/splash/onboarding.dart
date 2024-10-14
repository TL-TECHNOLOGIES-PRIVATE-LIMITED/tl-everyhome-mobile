import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/bg_images/onboarding_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 153.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF111D1E),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 220.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: 335.w,
                  height: 56.h,
                  child: Text(
                    'Professional Services & Product Details a Click Away',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111D1E),
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF0B252E),
                    Color(0x00343434),
                  ],
                ),
              ),
            ),
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
            top: 0.13.sh,
            right: 0.15.sw,
            child: Image.asset('assets/polygons/polygon_3.png'),
          ),
          Positioned.fill(
            bottom: 91.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomYellowButton(
                label: 'Get Started',
                onPress: () {
                  Navigator.of(context).pushReplacementNamed('/signin_screen');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

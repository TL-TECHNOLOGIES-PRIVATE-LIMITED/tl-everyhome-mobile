import 'dart:async';

import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/onboarding'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LigthColor().bgColorGrey,
      body: Stack(
        children: [
          Image.asset('assets/bg_images/background_image_1.png'),
          Positioned.fill(
            bottom: 180.h,
            child: Align(
              child: SvgPicture.asset('assets/logo/every_home_logo.svg'),
            ),
          ),
          Positioned.fill(
            child: Align(
              child: SvgPicture.asset('assets/logo/app_name.svg'),
            ),
          ),
          Positioned.fill(
            top: 60.h,
            child: Align(
              child: Text(
                '- TL TECHNOLOGIES -',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

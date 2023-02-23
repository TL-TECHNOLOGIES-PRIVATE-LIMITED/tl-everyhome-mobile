import 'dart:async';

import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // Image.asset('assets/logo/logo_outline_right.png'),
          Positioned(
            top: 0.34.sh,
            right: 0.38.sw,
            child: Align(
              child: Image.asset('assets/logo/logo.png'),
            ),
          ),
          Positioned(
            top: 0.53.sh,
            right: 0.32.sw,
            child: Align(
              child: Text(
                '- TL TECHNOLOGIES -',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Align(
            child: Image.asset('assets/logo/app_name.png'),
          ),
        ],
      ),
    );
  }
}

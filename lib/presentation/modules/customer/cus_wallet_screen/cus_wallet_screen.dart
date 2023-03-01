import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CusWalletScreen extends StatelessWidget {
  const CusWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Wallet'),
        ),
        body: Stack(
          children: [
            Align(
              child: SvgPicture.asset('assets/polygons/background_ring.svg'),
            ),
            Align(
              child: SvgPicture.asset(
                'assets/polygons/background_ring.svg',
                height: 200,
                width: 200,
              ),
            ),

            //orange triangle
            Positioned(
              top: 0.2.sh,
              left: 0.15.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(40 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_1.png',
                ),
              ),
            ),
            //black circle
            Positioned(
              top: 0.2.sh,
              right: 0.25.sw,
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
              top: 0.5.sh,
              right: 0.17.sw,
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
              top: 0.57.sh,
              left: 0.4.sw,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(60 / 360),
                child: Image.asset(
                  'assets/polygons/polygon_1.png',
                ),
              ),
            ),
            Positioned.fill(
              bottom: 100.h,
              child: Align(
                child: Text(
                  'Hey!',
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                child: Text(
                  'We are cooking it up...',
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 100.h,
              child: Align(
                child: Text(
                  'Stay Tuned!',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffFEBA45),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:animations/animations.dart';
import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  final bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LigthColor().bgColorGrey,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/bg_images/background_image_1.png'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 64.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80.h),
                  Text(
                    'Join As...',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    width: 322.w,
                    height: 537.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 10.h,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/signup_screen');
                              },
                              child: Container(
                                height: 101.h,
                                width: 101.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff252C35),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/profile/customer_profile.svg',
                                    height: 90.h,
                                    width: 90.w,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'CUSTOMER',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w100,
                                color: const Color(0xff24292F),
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 10.h,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/signup_screen');
                              },
                              child: Container(
                                height: 101.h,
                                width: 101.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff252C35),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/profile/enabler_profile.svg',
                                    height: 80.h,
                                    width: 80.w,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'ENABLER/WORKER',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w100,
                                color: const Color(0xff24292F),
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 10.h,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/signup_screen');
                              },
                              child: Container(
                                height: 101.h,
                                width: 101.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff252C35),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                      'assets/profile/product_owner_profile.svg'),
                                ),
                              ),
                            ),
                            Text(
                              'BUSINESS OWNER',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w100,
                                color: const Color(0xff24292F),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

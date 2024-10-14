import 'dart:developer';

import 'package:every_home/presentation/modules/login/otp_screen/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../domain/core/theme.dart';
import '../../../widgets/custom_button.dart';
import '../sign_in_screen/widgets/custom_signin_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 428.w,
                height: 453.h,
                decoration: BoxDecoration(
                  color: LigthColor().bgColorGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 32.h),
                      Text(
                        'Enter OTP',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 6.h),
                      const CustomText(
                        text: 'A 4 digit code has been sent to',
                      ),
                      const CustomText(text: '+91 8987878699'),
                      SizedBox(height: 32.h),
                      Form(
                        child: Pinput(
                          length: 6,
                          defaultPinTheme: PinTheme(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                          ),
                          onCompleted: (pin) {
                            log(pin);
                          },
                        ),
                      ),
                      SizedBox(height: 64.h),
                      CustomYellowButton(
                        bgColor: LigthColor().buttonColorYellow,
                        label: 'Submit',
                        labelColor: LigthColor().buttonTextColorWhite,
                        onPress: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/google_map_screen', (route) => false);
                        },
                      ),
                      SizedBox(height: 59.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/signin_screen', (route) => false);
                        },
                        child: const CustomSignInText(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

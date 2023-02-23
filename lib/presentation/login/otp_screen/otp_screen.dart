import 'dart:developer';

import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/otp_screen/widgets/custom_submit_button.dart';
import 'package:every_home/presentation/login/otp_screen/widgets/custom_text.dart';
import 'package:every_home/presentation/login/widgets/custom_signin_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

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
                width: MediaQuery.of(context).size.width,
                height: 0.5.sh,
                decoration: BoxDecoration(
                  color: LigthColor().bgColorGrey,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color(0xffF6F6F6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      const CustomText(
                        text: 'A 4 digit code has been sent to',
                      ),
                      const CustomText(text: '+91 '),
                      const SizedBox(height: 24),
                      Form(
                        child: Column(
                          children: [
                            Pinput(
                              defaultPinTheme: const PinTheme(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              onCompleted: (pin) {
                                log(pin);
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),
                      CustomSubmitButton(
                        onPress: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/signin_screen', (route) => false);
                        },
                      ),
                      const SizedBox(height: 20),
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

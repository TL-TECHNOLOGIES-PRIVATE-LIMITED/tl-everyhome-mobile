import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/custom_signup_text.dart';
import 'package:every_home/presentation/login/sign_up_screen/widgets/custom_facebook_button.dart';
import 'package:every_home/presentation/login/sign_up_screen/widgets/custom_google_button.dart';
import 'package:every_home/presentation/widgets/CustomFormField.dart';
import 'package:every_home/presentation/widgets/CustomYellowButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            // Image.asset('assets/logo/logo_outline_right.png'),
            SizedBox(height: 100.h),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 239.w,
                      height: 96.h,
                      child: Text(
                        'Create your Account',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 50.h,
                      width: 368.w,
                      child: const CustomFormField(
                        hintText: 'Full Name',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 50.h,
                      width: 368.w,
                      child: const CustomFormField(
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 50.h,
                      width: 368.w,
                      child: const CustomFormField(
                        hintText: 'Mobile Number',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 50.h,
                      width: 368.w,
                      child: const CustomFormField(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 50.h,
                      width: 368.w,
                      child: const CustomFormField(
                        hintText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // TODO sign up button logic implemetation
                    CustomYellowButton(
                      bgColor: LigthColor().buttonColorYellow,
                      label: 'Sign Up',
                      labelColor: LigthColor().buttonTextColorWhite,
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/otp_screen', (route) => false);
                      },
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 0.9.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/polygons/line.png'),
                          const Text(
                            'or continue with',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Image.asset('assets/polygons/line.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomFacebookButton(
                      onPress: () {},
                    ),
                    SizedBox(height: 20.h),
                    CustomGoogleButton(
                      onPress: () {},
                    ),
                    SizedBox(height: 40.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CustomSignUpText(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

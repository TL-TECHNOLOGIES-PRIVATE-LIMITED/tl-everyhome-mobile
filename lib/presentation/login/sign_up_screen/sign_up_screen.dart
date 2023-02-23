import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/custom_signup_text.dart';
import 'package:every_home/presentation/login/sign_up_screen/widgets/custom_facebook_button.dart';
import 'package:every_home/presentation/login/sign_up_screen/widgets/custom_google_button.dart';
import 'package:every_home/presentation/login/sign_up_screen/widgets/custom_signup_button.dart';
import 'package:every_home/presentation/login/widgets/custom_signin_text.dart';
import 'package:every_home/presentation/widgets/CustomFormField.dart';
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'Create your Account',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      width: 0.85.sw,
                      child: const CustomFormField(
                        hintText: 'Full Name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: 0.85.sw,
                      child: const CustomFormField(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: 0.85.sw,
                      child: const CustomFormField(
                        hintText: 'Mobile Number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: 0.85.sw,
                      child: const CustomFormField(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: 0.85.sw,
                      child: const CustomFormField(
                        hintText: 'Confirm Password',
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomSignUpButton(
                      onPress: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/otp_screen');
                      },
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    const CustomFacebookButton(),
                    const SizedBox(height: 17),
                    const CustomGoogleButton(),
                    const SizedBox(height: 20),
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

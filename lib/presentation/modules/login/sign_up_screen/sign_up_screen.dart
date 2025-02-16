import 'package:every_home/presentation/modules/login/sign_up_screen/widgets/custom_facebook_button.dart';
import 'package:every_home/presentation/modules/login/sign_up_screen/widgets/custom_google_button.dart';
import 'package:every_home/presentation/modules/login/sign_up_screen/widgets/custom_signup_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../domain/core/theme.dart';
import '../../../../domain/validation/signin_screen/signin_validation.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_form_field.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget with InputValidationMixin {
  SignUpScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();
  ValueNotifier<bool> hidePasswordNotifier = ValueNotifier(true);
  final TextEditingController fullNameContoller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
            Image.asset('assets/bg_images/background_image_1.png'),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 43.w),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 94.h),
                      SizedBox(
                        width: 239.w,
                        height: 96.h,
                        child: Text(
                          'Create your Account',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomFormField(
                        hintText: 'Full Name',
                        textInputAction: TextInputAction.next,
                        controller: fullNameContoller,
                        validator: (name) {
                          if (name!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Enter your full name';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomFormField(
                        hintText: 'Email',
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (isEmailValid(email!)) {
                            return null;
                          } else {
                            return 'Enter a valid email address';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomFormField(
                        hintText: 'Mobile Number',
                        textInputAction: TextInputAction.next,
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        validator: (mobile) {
                          if (isMobileNumValid(mobile!)) {
                            return null;
                          } else {
                            return 'Enter a valid mobile number';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomFormField(
                        hintText: 'Password',
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        validator: (password) {
                          if (isPasswordValid(password!)) {
                            return null;
                          } else {
                            return 'Enter a valid password';
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                      ValueListenableBuilder(
                          valueListenable: hidePasswordNotifier,
                          builder: (context, value, _) {
                            return CustomFormField(
                              hintText: 'Confirm Password',
                              controller: confirmPasswordController,
                              textInputAction: TextInputAction.done,
                              obscureText: hidePasswordNotifier.value,
                              validator: (password) {
                                final passwordval = passwordController.value;
                                final confirmPassword =
                                    confirmPasswordController.value;
                                if (isPasswordValid(password!)) {
                                  if (passwordval == confirmPassword) {
                                    return null;
                                  } else {
                                    return 'Password doesn\'t match';
                                  }
                                } else {
                                  return 'Enter a valid password';
                                }
                              },
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  hidePasswordNotifier.value =
                                      !hidePasswordNotifier.value;
                                },
                                child: value
                                    ? const Icon(MdiIcons.eyeOffOutline,
                                        color: Color(0xffBDBDBD))
                                    : const Icon(MdiIcons.eyeOutline,
                                        color: Color(0xffBDBDBD)),
                              ),
                            );
                          }),
                      SizedBox(height: 30.h),
                      // TODO sign up button logic implemetation
                      Center(
                        child: CustomYellowButton(
                          bgColor: LigthColor().buttonColorYellow,
                          label: 'Sign Up',
                          labelColor: LigthColor().buttonTextColorWhite,
                          onPress: () {
                            if (formGlobalKey.currentState!.validate()) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/otp_screen', (route) => false);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 21.h),
                      Center(
                        child: SizedBox(
                          width: 0.9.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/polygons/line.png'),
                              Text(
                                'or continue with',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Image.asset('assets/polygons/line.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: CustomFacebookButton(
                          onPress: () {},
                        ),
                      ),
                      SizedBox(height: 17.h),
                      Center(
                        child: CustomGoogleButton(
                          onPress: () {},
                        ),
                      ),
                      SizedBox(height: 39.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/signin_screen', (route) => false);
                        },
                        child: const CustomSignUpText(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

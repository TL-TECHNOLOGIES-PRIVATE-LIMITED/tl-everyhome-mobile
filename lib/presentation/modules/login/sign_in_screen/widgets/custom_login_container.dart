import 'dart:developer';

import 'package:every_home/domain/authentication/login_auth.dart';
import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/domain/models/signin_screen/signin_model.dart';
import 'package:every_home/domain/validation/signin_screen/signin_validation.dart';
import 'package:every_home/presentation/modules/login/sign_in_screen/widgets/custom_signin_text.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickalert/quickalert.dart';

// ignore: must_be_immutable
class CustomLoginContainer extends StatelessWidget with InputValidationMixin {
  CustomLoginContainer({
    super.key,
  });
  final formGlobalKey = GlobalKey<FormState>();
  ValueNotifier<bool> hidePasswordNotifier = ValueNotifier(true);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 24.h),
            Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      validator: (email) {
                        if (isEmailValid(email!)) {
                          return null;
                        } else {
                          return 'Enter a valid email address';
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    ValueListenableBuilder(
                        valueListenable: hidePasswordNotifier,
                        builder: (context, value, _) {
                          return CustomFormField(
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            controller: passwordController,
                            hintText: 'Password',
                            textInputAction: TextInputAction.done,
                            obscureText: hidePasswordNotifier.value,
                            validator: (password) {
                              if (isPasswordValid(password!)) {
                                return null;
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
                  ],
                )),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 5.w,
              children: [
                Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/forget_password_screen');
                  },
                  child: Text(
                    'Resend',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: LigthColor().textColorYellow,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
            Center(
              child: CustomYellowButton(
                label: 'Login',
                bgColor: LigthColor().buttonColorYellow,
                labelColor: LigthColor().buttonTextColorWhite,
                onPress: () {
                  //TODO need to change pushNamed to pushNamedAndRemoveUntil
                  if (formGlobalKey.currentState!.validate()) {
                    // formGlobalKey.currentState!.save();
                    final inputEmail = emailController.text.trim();
                    final inputPassword = passwordController.text.trim();
                    SignInModel loginModel = SignInModel(
                        email: inputEmail, password: inputPassword);
                    final loginResponse =
                        LogiAuth().loginAuthentication(loginModel);
                    if (loginResponse['status'] == true) {
                      if (loginResponse['user_type'] == 1) {
                        log('customer');
                        Navigator.of(context).pushNamed('/cus_main_screen');
                      } else if (loginResponse['user_type'] == 2) {
                        log('enabler');
                        Navigator.of(context)
                            .pushNamed('/ena_profile_create_screen');
                      } else {
                        log('business');
                        Navigator.of(context)
                            .pushNamed('/pro_create_profile_screen');
                      }
                    } else {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'Your email and password doesn\'t match');
                    }

                    // use the email provided here
                  }
                },
              ),
            ),
            SizedBox(height: 25.h),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/create_account_screen');
              },
              child: const CustomSignInText(),
            ),
          ],
        ),
      ),
    );
  }
}

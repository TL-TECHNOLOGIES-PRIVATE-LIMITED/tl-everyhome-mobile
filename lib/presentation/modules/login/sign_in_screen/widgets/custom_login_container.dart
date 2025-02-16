import 'dart:developer';

import 'package:every_home/domain/authentication/login_auth.dart';
import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/domain/models/signin_screen/signin_model.dart';
import 'package:every_home/domain/validation/signin_screen/signin_validation.dart';
import 'package:every_home/presentation/modules/login/sign_in_screen/widgets/custom_signin_text.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

// ignore: must_be_immutable
class CustomLoginContainer extends StatefulWidget with InputValidationMixin {
  CustomLoginContainer({
    super.key,
  });

  @override
  State<CustomLoginContainer> createState() => _CustomLoginContainerState();
}

class _CustomLoginContainerState extends State<CustomLoginContainer> {
  final formGlobalKey = GlobalKey<FormState>();

  ValueNotifier<bool> hidePasswordNotifier = ValueNotifier(true);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isValidColor = true;
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
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    validator: (email) {
                      if (widget.isEmailValid(email!)) {
                        return null;
                      } else {
                        log(isValidColor.toString(), name: 'chhi');

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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        controller: passwordController,
                        hintText: 'Password',
                        textInputAction: TextInputAction.done,
                        obscureText: hidePasswordNotifier.value,
                        validator: (password) {
                          if (widget.isPasswordValid(password!)) {
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
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 5.w,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/forget_password_screen');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.displaySmall,
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
                    final inputEmail =
                        emailController.text.toLowerCase().trim();
                    final inputPassword =
                        passwordController.text.toLowerCase().trim();
                    SignInModel loginModel =
                        SignInModel(email: inputEmail, password: inputPassword);
                    final loginResponse =
                        LogiAuth().loginAuthentication(loginModel);
                    if (loginResponse['status'] == true) {
                      if (loginResponse['user_type'] == 1) {
                        log('customer');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/cus_main_screen',
                          (route) => false,
                        );
                      } else if (loginResponse['user_type'] == 2) {
                        log('enabler');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/ena_profile_create_screen',
                          (route) => false,
                        );
                      } else {
                        log('business');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/pro_create_profile_screen',
                          (route) => false,
                        );
                      }
                    } else {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: 'Your email and password doesn\'t match',
                      );
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

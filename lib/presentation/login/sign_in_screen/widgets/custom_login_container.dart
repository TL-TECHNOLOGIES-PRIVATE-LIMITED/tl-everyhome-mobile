import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/domain/validation/signin_screen/signin_validation.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/custom_signin_text.dart';
import 'package:every_home/presentation/modules/enabler/ena_main_screen/cus_main_screen.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: must_be_immutable
class CustomLoginContainer extends StatelessWidget with InputValidationMixin {
  CustomLoginContainer({
    super.key,
  });
  final formGlobalKey = GlobalKey<FormState>();
  ValueNotifier<bool> hidePasswordNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 428.w,
        // height: 454.h,
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
                style: TextStyle(
                  fontSize: 40.sp,
                  color: const Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/forget_password_screen');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffF6F6F6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                      Navigator.of(context).pushNamed('/cus_main_screen');

                      // use the email provided here
                    }
                  },
                ),
              ),
              SizedBox(height: 25.h),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed('/signup_screen');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => EnaMainScreen())));
                },
                child: const CustomSignInText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

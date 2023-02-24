import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/custom_signup_text.dart';
import 'package:every_home/presentation/widgets/CustomFormField.dart';
import 'package:every_home/presentation/widgets/CustomYellowButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 428.w,
        height: 454.h,
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
                  child: Column(
                children: [
                  const CustomFormField(
                    hintText: 'Email',
                  ),
                  SizedBox(height: 20.h),
                  const CustomFormField(
                    hintText: 'Password',
                    suffixIcon:
                        Icon(MdiIcons.eyeOffOutline, color: Color(0xffBDBDBD)),
                  ),
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
              CustomYellowButton(
                label: 'Login',
                bgColor: LigthColor().buttonColorYellow,
                labelColor: LigthColor().buttonTextColorWhite,
                onPress: () {
                  //TODO need to change pushNamed to pushNamedAndRemoveUntil
                  Navigator.of(context).pushNamed('/cus_main_screen');
                },
              ),
              SizedBox(height: 25.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup_screen');
                },
                child: const CustomSignUpText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/domain/validation/signin_screen/signin_validation.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomForgotPasswordContainer extends StatelessWidget
    with InputValidationMixin {
  CustomForgotPasswordContainer({
    super.key,
  });
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 428.w,
        height: 451.h,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).pushNamedAndRemoveUntil(
              //         '/signin_screen', (route) => false);
              //   },
              //   child: SvgPicture.asset('assets/icons/arrow_left.svg'),
              // ),
              SizedBox(height: 55.h),
              Text(
                'Forgot',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Password?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 7.h),
              Text(
                'Don\'t Worry. Please enter your email',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w300),
              ),
              Text(
                'associated with your account',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w300),
              ),

              SizedBox(height: 49.h),
              Center(
                child: Form(
                  key: formGlobalKey,
                  child: CustomFormField(
                    hintText: 'Email ID',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: (email) {
                      if (isEmailValid(email!)) {
                        return null;
                      } else {
                        return 'Enter a valid email address';
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              Center(
                child: CustomYellowButton(
                  bgColor: LigthColor().buttonColorYellow,
                  label: 'Submit',
                  labelColor: LigthColor().buttonTextColorWhite,
                  onPress: () {
                    if (formGlobalKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed('/otp_screen');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

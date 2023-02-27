import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/domain/validation/signin_screen/signin_validation.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        width: MediaQuery.of(context).size.width,
        // height: 0.5.sh,
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/signin_screen', (route) => false);
                },
                child: SvgPicture.asset('assets/icons/arrow_left.svg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Forgot',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Password?',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              // const SizedBox(height: 5),
              const Text(
                'Don\'t Worry. Please enter your email',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                'associated with your account',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 30),
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    CustomFormField(
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
                  ],
                ),
              ),

              const SizedBox(height: 25),
              CustomYellowButton(
                bgColor: LigthColor().buttonColorYellow,
                label: 'Submit',
                labelColor: LigthColor().buttonTextColorWhite,
                onPress: () {
                  if (formGlobalKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed('/otp_screen');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

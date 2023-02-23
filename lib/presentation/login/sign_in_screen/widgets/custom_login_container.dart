import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/cusotm_login_button.dart';
import 'package:every_home/presentation/login/sign_in_screen/widgets/custom_signup_text.dart';
import 'package:every_home/presentation/widgets/CustomFormField.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              Form(
                  child: Column(
                children: const [
                  CustomFormField(
                    hintText: 'Email',
                  ),
                  SizedBox(height: 20),
                  CustomFormField(
                    hintText: 'Password',
                    suffixIcon:
                        Icon(MdiIcons.eyeOffOutline, color: Color(0xffBDBDBD)),
                  ),
                ],
              )),
              const SizedBox(height: 16),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 25),
              CustomLoginButton(
                onPress: () {},
              ),
              const SizedBox(height: 10),
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

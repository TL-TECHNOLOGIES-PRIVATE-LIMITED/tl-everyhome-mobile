import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/domain/validation/signin_screen/signin_validation.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: must_be_immutable
class CustomResetContainer extends StatelessWidget with InputValidationMixin {
  CustomResetContainer({
    super.key,
  });
  final formGlobalKey = GlobalKey<FormState>();
  ValueNotifier<bool> hidePasswordNotifier = ValueNotifier(true);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                'Reset',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffF6F6F6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: passwordController,
                      hintText: 'New Password',

                      textInputAction: TextInputAction.next,
                      validator: (password) {
                        if (isPasswordValid(password!)) {
                          return null;
                        } else {
                          return 'Enter a valid password';
                        }
                      },
                      // suffixIcon: Icon(MdiIcons.eyeOffOutline,
                      //     color: Color(0xffBDBDBD)),
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                        valueListenable: hidePasswordNotifier,
                        builder: (context, value, _) {
                          return CustomFormField(
                            controller: confirmPasswordController,
                            textInputAction: TextInputAction.done,
                            hintText: 'Confirm New Password',
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
                  ],
                ),
              ),
              const SizedBox(height: 25),
              CustomYellowButton(
                bgColor: LigthColor().buttonColorYellow,
                label: 'Submit',
                labelColor: LigthColor().buttonTextColorWhite,
                onPress: () {
                  // final confirmPassword = confirmPasswordController.value;
                  if (formGlobalKey.currentState!.validate()) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signin_screen', (route) => false);
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

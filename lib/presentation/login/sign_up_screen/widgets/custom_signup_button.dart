
import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpButton extends StatelessWidget {
  const CustomSignUpButton({
    super.key,
    this.onPress,
  });
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.85.sw,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(350, 55),
          backgroundColor: LigthColor().buttonColorYellow,
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: LigthColor().buttonTextColorWhite,
          ),
        ),
      ),
    );
  }
}

import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
    this.onPress,
  });
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(350, 55),
        backgroundColor: LigthColor().buttonColorYellow,
      ),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: LigthColor().buttonTextColorWhite,
        ),
      ),
    );
  }
}

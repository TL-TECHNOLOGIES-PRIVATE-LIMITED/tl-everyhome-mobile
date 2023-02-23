
import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    super.key,
    this.onPress,
  });
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(350, 55),
        backgroundColor: LigthColor().buttonColorYellow,
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: LigthColor().buttonTextColorWhite,
        ),
      ),
    );
  }
}

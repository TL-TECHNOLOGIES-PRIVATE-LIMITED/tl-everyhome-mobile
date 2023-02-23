import 'package:flutter/material.dart';

class CustomYellowButton extends StatelessWidget {
  const CustomYellowButton({
    super.key,
    required this.label,
    required this.bgColor,
    required this.labelColor,
    this.onPress,
  });
  final String label;
  final Color bgColor;
  final Color labelColor;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(350, 55),
        backgroundColor: bgColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: labelColor,
        ),
      ),
    );
  }
}

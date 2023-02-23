import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
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
          backgroundColor: Colors.white,
        ),
        child: Wrap(
          spacing: 20,
          children: [
            SvgPicture.asset(
              'assets/logo/google.svg',
              width: 40,
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sign Up with Google',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff262D37),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

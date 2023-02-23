import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFacebookButton extends StatelessWidget {
  const CustomFacebookButton({
    super.key, this.onPress,
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
          backgroundColor: const Color(0xff0C86E1),
        ),
        child: Wrap(
          spacing: 20,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: SvgPicture.asset('assets/logo/facebook.svg',
                  width: 40, height: 40),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sign Up with Facebook',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: LigthColor().buttonTextColorWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

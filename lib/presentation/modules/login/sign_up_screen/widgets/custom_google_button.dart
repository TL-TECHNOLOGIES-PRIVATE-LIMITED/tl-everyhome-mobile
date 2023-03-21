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
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: Size(343.w, 55.h),
        backgroundColor: Colors.white,
      ),
      child: Wrap(
        spacing: 20,
        children: [
          SvgPicture.asset(
            'assets/logo/google.svg',
            width: 36,
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sign Up with Google',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff262D37),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

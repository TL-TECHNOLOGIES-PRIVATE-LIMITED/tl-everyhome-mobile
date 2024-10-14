import 'package:every_home/domain/core/theme.dart';
import 'package:flutter/material.dart';

class CustomSignInText extends StatelessWidget {
  const CustomSignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Wrap(
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xffF6F6F6),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            'Sign In',
            style: TextStyle(
              fontSize: 14,
              color: LigthColor().buttonColorYellow,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

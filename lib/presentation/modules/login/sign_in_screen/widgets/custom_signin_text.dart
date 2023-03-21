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
          Text(
            'New Here?',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(width: 5),
          Text(
            'Sign Up',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: LigthColor().textColorYellow,
                ),
          ),
        ],
      ),
    );
  }
}

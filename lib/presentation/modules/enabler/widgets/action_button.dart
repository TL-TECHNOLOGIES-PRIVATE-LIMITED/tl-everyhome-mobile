import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(174.w, 50.h),
            shape: const StadiumBorder(),
            backgroundColor: const Color(0xffE83838),
          ),
          child: Text(
            'Reject',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/ena_negotiate_screen');
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            minimumSize: Size(174.w, 50.h),
          ),
          child: Text(
            'Negotiate',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

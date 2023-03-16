import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCustomerDetailsTile extends StatelessWidget {
  const CustomCustomerDetailsTile({
    super.key,
    this.callButton,
    this.msgButton,
  });
  final void Function()? callButton;
  final void Function()? msgButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          textColor: Colors.white,
          leading: const CircleAvatar(
              // backgroundImage: AssetImage('assets/user/profile.png'),
              ),
          title: Text(
            "Samuel John",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Swathi, karakulam Jn Kachani,Near Temple,TVM,pin - 680522',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.15),
            GestureDetector(
              onTap: callButton,
              child: Container(
                height: 35.h,
                width: 35.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.call_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
            SizedBox(width: 13.w),
            GestureDetector(
              onTap: msgButton,
              child: Container(
                height: 35.h,
                width: 35.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.white,
        ),
      ],
    );
  }
}

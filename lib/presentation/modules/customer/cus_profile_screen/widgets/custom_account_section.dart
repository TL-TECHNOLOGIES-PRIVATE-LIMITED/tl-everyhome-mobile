import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAccountSection extends StatelessWidget {
  const CustomAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: Container(
            height: 100.h,
            width: 120.w,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset('assets/profile/customer_profile.svg'),
                  Text(
                    'Customer',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 100.h,
          width: 120.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffFEBA45),
            ),
          ),
          child: Center(
              child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              SvgPicture.asset('assets/profile/enabler_profile.svg'),
              Text(
                'Enabler',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )),
        ),
        Container(
          height: 100.h,
          width: 120.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(
              color: const Color(0xffFEBA45),
            ),
          ),
          child: Center(
              child: Wrap(
            direction: Axis.vertical,
            spacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/profile/product_owner_profile.svg',
                height: 40,
                width: 40,
              ),
              Text(
                'Product Owner',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )),
        ),
      ],
    );
  }
}

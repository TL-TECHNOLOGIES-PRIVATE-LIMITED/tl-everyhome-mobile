import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdressContainer extends StatelessWidget {
  const CustomAdressContainer({
    super.key,
    required this.currentAdress,
  });

  final Map<String, dynamic>? currentAdress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Use Saved Address',
        //   style: TextStyle(
        //       fontSize: 16.sp,
        //       fontWeight: FontWeight.w400,
        //       color: Colors.white),
        // ),
        SizedBox(height: 5.h),
        Center(
          child: Container(
            width: 360.w,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(22.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 3.w, right: 5.w, top: 2.w, bottom: 2.w),
                    decoration: BoxDecoration(
                        color: const Color(0xff23272C),
                        borderRadius: BorderRadius.all(Radius.circular(35.r))),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.w,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffFEBA45),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 18.r,
                          ),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffFEBA45),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${currentAdress?['street'] ?? ''},${currentAdress?['locality'] ?? ''},\n${currentAdress?['state'] ?? ''},${currentAdress?['postal_code'] ?? ''},${currentAdress?['country'] ?? ''}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff23272C),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

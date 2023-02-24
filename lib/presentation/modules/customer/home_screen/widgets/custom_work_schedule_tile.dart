import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWorkScheduleTile extends StatelessWidget {
  const CustomWorkScheduleTile({
    super.key,
    required this.workName,
    required this.postedDate,
    required this.postedTime,
    this.onTap,
  });
  final String workName;
  final String postedDate;
  final String postedTime;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 157.w,
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Color(0xFFDAB46D),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          workName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Wrap(
                        children: [
                          Text(
                            postedDate,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ', $postedTime',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ]),
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset('assets/icons/arrow_right.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

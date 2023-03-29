
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProUserReviewTile extends StatelessWidget {
  const CustomProUserReviewTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(),
                title: Text(
                  'Sijo Simon',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff252C35),
                  ),
                ),
                subtitle: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5.w,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: 4.2,
                      allowHalfRating: true,
                      itemSize: 18.r,
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      onRatingUpdate: (value) {},
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff252C35),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Great service and good products. Thank you.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff252C35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
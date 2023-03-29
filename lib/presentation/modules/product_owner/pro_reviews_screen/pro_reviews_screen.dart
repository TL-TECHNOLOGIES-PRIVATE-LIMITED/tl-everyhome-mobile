import 'package:every_home/presentation/modules/product_owner/pro_reviews_screen/widgets/custom_pro_linear_progress.dart';
import 'package:every_home/presentation/modules/product_owner/pro_reviews_screen/widgets/custom_pro_user_review_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProReviewsScreen extends StatelessWidget {
  const ProReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 334.h,
            width: 428.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              color: const Color(0xff262E39),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Wrap(
                      spacing: 10.w,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 14.w,
                      children: [
                        Container(
                          // height: 52.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFDBB12),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '4.2',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff262E39),
                              ),
                            ),
                          ),
                        ),
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: 4.2,
                          allowHalfRating: true,
                          itemSize: 30.r,
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                          onRatingUpdate: (value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  const CustomProLinearProgress(
                      progress: 0.8, rating: '5.0', ratingCount: '60'),
                  const CustomProLinearProgress(
                      progress: 0.2, rating: '4.0', ratingCount: '70'),
                  const CustomProLinearProgress(
                      progress: 0.5, rating: '3.0', ratingCount: '38'),
                  const CustomProLinearProgress(
                      progress: 0.7, rating: '2.0', ratingCount: '76'),
                  const CustomProLinearProgress(
                      progress: 0.3, rating: '1.0', ratingCount: '12'),
                  SizedBox(height: 9.h),
                  Center(
                    child: Text(
                      'Average Rating by 60 People',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CustomProUserReviewTile();
                }),
          )
        ],
      ),
    );
  }
}

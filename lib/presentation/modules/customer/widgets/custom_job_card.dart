import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomJobCard extends StatelessWidget {
  const CustomJobCard({
    super.key,
    required this.image,
    required this.jobTitle,
    required this.jobLocation,
    required this.rating,
    required this.reviewCount,
    this.isFavourite,
  });

  final String image;
  final String jobTitle;
  final String jobLocation;
  final double rating;
  final String reviewCount;
  final bool? isFavourite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 16.h),
      child: Container(
        width: 355.w,
        height: 110.h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff898989)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 80.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        jobTitle,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Wrap(
                        spacing: 3,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          Text(
                            jobLocation,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Wrap(
                        spacing: 5,
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: rating,
                            allowHalfRating: true,
                            itemSize: 16,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            onRatingUpdate: (value) {},
                          ),
                          Text(
                            '$rating($reviewCount Reviews)',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // direction: Axis.vertical,
                // runAlignment: WrapAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isFavourite!
                      ? Icon(
                          Icons.favorite,
                          color: Colors.amber,
                          size: 18.h,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.amber,
                          size: 18.h,
                        ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xffC7C7C7),
                  ),
                  SizedBox(
                    height: 12,
                    width: 12,
                    child: Checkbox(
                      tristate: true,
                      value: false,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

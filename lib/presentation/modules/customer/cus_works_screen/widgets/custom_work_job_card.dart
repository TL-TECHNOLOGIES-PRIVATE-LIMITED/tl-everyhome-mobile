import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWorkJobCard extends StatelessWidget {
  const CustomWorkJobCard({
    super.key,
    required this.image,
    required this.jobTitle,
    required this.jobLocation,
    required this.date,
    required this.cardType,
    required this.time,
    required this.isPending,
    required this.isActive,
  });

  final String image;
  final String jobTitle;
  final String jobLocation;
  final String date;
  final String cardType;
  final String time;
  final bool isPending;
  final bool isActive;

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
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          isPending
                              ? Text(
                                  'Pending',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.red,
                                  ),
                                )
                              : isActive
                                  ? Text(
                                      'Active',
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.green,
                                      ),
                                    )
                                  : Text(
                                      'Completed',
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.amber,
                                      ),
                                    ),
                          Text(
                            date,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Text(
                            time,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12.sp),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xffC7C7C7),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

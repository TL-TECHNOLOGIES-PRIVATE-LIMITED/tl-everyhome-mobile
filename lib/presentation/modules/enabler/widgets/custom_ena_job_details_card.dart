import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEnaJobDetailsCard extends StatelessWidget {
  const CustomEnaJobDetailsCard({
    super.key,
    this.jobType,
    this.jobDescription,
    this.price,
    this.postedTime,
  });

  final String? jobType;
  final String? jobDescription;
  final String? price;
  final String? postedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      jobType ?? 'Ceiling Light Repair',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(postedTime ?? '8 hrs ago'),
                        const SizedBox(width: 10),
                        const Icon(Icons.favorite, color: Color(0xffFFA610))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 400.w,
                  child: Text(
                    jobDescription ??
                        'tell carefully eight sing equal built common quiet strange due cook wear tin exist officer fire feed funny wonderful breathe nation barn torn carry',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 5.w,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            price ?? '800 per day',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Wrap(
                    //     crossAxisAlignment: WrapCrossAlignment.center,
                    //     direction: Axis.vertical,
                    //     children: [
                    //       Text(
                    //         'Audio instruction',
                    //         style: TextStyle(
                    //           color: Colors.black.withOpacity(0.5),
                    //         ),
                    //       ),
                    //       const SizedBox(height: 10),
                    //       Wrap(
                    //         children: [
                    //           const CircleAvatar(
                    //             backgroundColor: Color(0xffFFA610),
                    //             child: Icon(
                    //               Icons.play_arrow,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(color: Colors.black),
                    //               ),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(4.0),
                    //                 child: Row(
                    //                   children: [
                    //                     // Image.asset('assets/user/voice.png'),
                    //                     // Image.asset('assets/user/voice.png'),
                    //                     const SizedBox(width: 4),
                    //                     Text(
                    //                       '00:30',
                    //                       style: TextStyle(
                    //                         color:
                    //                             Colors.black.withOpacity(0.5),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

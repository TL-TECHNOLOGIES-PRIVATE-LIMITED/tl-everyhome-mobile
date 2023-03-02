import 'package:every_home/presentation/modules/customer/cus_view_job_card/widgets/custom_job_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWorkerRatingAppBar extends StatelessWidget {
  const CustomWorkerRatingAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: Container(
          // height: 340.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff22262B),
                Color(0xFF252E39),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                SizedBox(
                  width: 1.sw,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Work Details',
                        style: TextStyle(
                          color: const Color(0xffFFFDFD),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  dense: true,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  leading: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ),
                      )
                    ],
                  ),
                  title: Wrap(
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'Samuel john',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            '1000 INR/hr',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  subtitle: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_icon.svg',
                        height: 15,
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Trivandrum, Palayam',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: .18.sw, bottom: 20.h),
                  child: Wrap(
                    spacing: 5,
                    children: [
                      RatingBar.builder(
                        unratedColor: const Color(0xffACACAC),
                        ignoreGestures: true,
                        initialRating: 3.5,
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
                        '3.5',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: const Color(0xffFFFFFF),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CustomJobDetailsTile(
                        icon: 'assets/icons/distance_icon.svg',
                        type: 'DISTANCE',
                        details: '5KM',
                      ),
                      CustomJobDetailsTile(
                        icon: 'assets/icons/calender_icon.svg',
                        type: 'DATE',
                        details: '21/02/2022',
                      ),
                      CustomJobDetailsTile(
                        icon: 'assets/icons/time_icon.svg',
                        type: 'TIMING',
                        details: '11:00PM',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

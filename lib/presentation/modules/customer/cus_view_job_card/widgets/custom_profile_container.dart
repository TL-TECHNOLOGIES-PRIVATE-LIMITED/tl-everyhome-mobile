
import 'package:every_home/presentation/modules/customer/cus_view_job_card/widgets/custom_job_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({
    super.key,
    required ValueNotifier<int> indexNotifier,
  }) : _indexNotifier = indexNotifier;

  final ValueNotifier<int> _indexNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Container(
              height: 320.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff22262B),
                    Color(0xFF252E39),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).viewPadding.top,
                    child: SizedBox(
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
                            'Profile',
                            style: TextStyle(
                              color: const Color(0xffFFFDFD),
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      child: ListTile(
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
                        title: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Samuel john',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        subtitle: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location_icon.svg',
                              height: 15,
                              width: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Trivandrum, Palayam',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 80.h,
                    right: 160.w,
                    child: Align(
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
                  ),
                  Positioned.fill(
                    top: 200.h,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CustomJobDetailsTile(
                            icon: 'assets/icons/distance_icon.svg',
                            type: 'DISTANCE',
                            details: '5 KM',
                          ),
                          CustomJobDetailsTile(
                            icon: 'assets/icons/job_icon.svg',
                            type: 'JOB',
                            details: '107',
                          ),
                          CustomJobDetailsTile(
                            icon: 'assets/icons/reviews_icon.svg',
                            type: 'REVIEWS',
                            details: '5',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 270.h,
            child: Align(
              child: ValueListenableBuilder(
                  valueListenable: _indexNotifier,
                  builder: (context, newIndex, _) {
                    return MaterialSegmentedControl(
                      verticalOffset: 10.w,
                      horizontalPadding: const EdgeInsets.all(10),
                      borderWidth: 1,
                      selectedColor: const Color(0xffFEBA45),
                      onSegmentTapped: (value) {
                        _indexNotifier.value = value;
                      },
                      unselectedColor: const Color(0xffE9E9E9),
                      unselectedTextStyle:
                          const TextStyle(color: Color(0xff727272)),
                      selectedTextStyle:
                          const TextStyle(color: Color(0xff252C35)),
                      selectionIndex: newIndex,
                      children: {
                        0: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 25.h),
                            child: const Text('About')),
                        1: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Reviews')),
                        2: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Portfolio')),
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}


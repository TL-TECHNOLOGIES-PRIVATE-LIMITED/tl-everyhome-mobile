import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import '../../../../../domain/dummy/models/dummy_worker_model.dart';
import 'custom_job_details_tile.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({
    super.key,
    required ValueNotifier<int> indexNotifier,
    required this.data,
  }) : _indexNotifier = indexNotifier;

  final ValueNotifier<int> _indexNotifier;
  final DummyWorker data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
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
                    ListTile(
                      dense: true,
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      leading: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              //TODO profile image
                              backgroundImage:
                                  AssetImage(data.profilePic.toString()),
                            ),
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
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                        children: [
                          Text(
                            //TODO profile name
                            data.name.toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
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
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                data.place.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
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
                          padding: EdgeInsets.symmetric(horizontal: 25.h),
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
    );
  }
}

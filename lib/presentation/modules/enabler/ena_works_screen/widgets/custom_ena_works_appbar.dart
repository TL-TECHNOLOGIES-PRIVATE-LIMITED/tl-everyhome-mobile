import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CustomEnaWorksAppBar extends StatelessWidget {
  const CustomEnaWorksAppBar({
    super.key,
    required ValueNotifier<int> indexNotifier,
    required this.activeCount,
    required this.pendingCount,
    required this.completedCount,
  }) : _indexNotifier = indexNotifier;

  final ValueNotifier<int> _indexNotifier;
  final String activeCount;
  final String pendingCount;
  final String completedCount;

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
                padding: EdgeInsets.only(bottom: 30.h, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).viewPadding.top),
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Works Lists (15)',
                            style: TextStyle(
                              color: const Color(0xffFFFDFD),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 0.75.sw,
                          child: const CustomFormField(
                              prefixIcon: Icon(
                                IconlyLight.search,
                                color: Colors.black,
                              ),
                              hintText: 'Search your Requirements'),
                        ),
                        SizedBox(width: 0.02.sh),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/filter_icon.svg',
                              ),
                            ),
                          ),
                        )
                      ],
                    )
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
                    verticalOffset: 10.h,
                    horizontalPadding: const EdgeInsets.all(10),
                    borderWidth: 1,
                    selectedColor: const Color(0xffFEBA45),
                    onSegmentTapped: (value) {
                      _indexNotifier.value = value;
                    },
                    unselectedColor: const Color(0xffE9E9E9),
                    unselectedTextStyle: TextStyle(
                        color: const Color(0xff727272), fontSize: 14.sp),
                    selectedTextStyle: TextStyle(
                        color: const Color(0xff252C35), fontSize: 14.sp),
                    selectionIndex: newIndex,
                    children: {
                      0: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.h),
                          child: Text('Pending ($pendingCount)')),
                      1: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Active ($activeCount)')),
                      2: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Completed ($completedCount)')),
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}

import 'package:every_home/presentation/modules/enabler/widgets/custom_ena_job_details_card.dart';
import 'package:every_home/presentation/modules/enabler/widgets/custom_ena_workers_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slider_button/slider_button.dart';

class EnaWorkFinshScreen extends StatelessWidget {
  const EnaWorkFinshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262E39),
      appBar: AppBar(
        elevation: 3,
        title: const Text('Job Details'),
        backgroundColor: const Color(0xff262E39),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomEnaJobDetailsCard(),
            SizedBox(height: 50.h),
            const CustomEnaWorkersImages(),
            SizedBox(height: 45.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'About Customer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 5.h),
                        child: Center(
                          child: Text(
                            "Get Direction",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff272F3A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              textColor: Colors.white,
              leading: const CircleAvatar(
                  // backgroundImage: AssetImage('assets/user/profile.png'),
                  ),
              title: Row(
                children: [
                  Text(
                    "Samuel John",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Text(
                            "4.8",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff272F3A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              subtitle: Text(
                'Swathi, karakulam Jn Kachani,Near Temple,TVM,pin - 680522',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                Container(
                  height: 35.h,
                  width: 35.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(width: 13.w),
                Container(
                  height: 35.h,
                  width: 35.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.white,
            ),
            SizedBox(height: 88.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SliderButton(
                  height: 60,
                  width: 280.w,
                  backgroundColor: const Color(0xffFFA610),
                  radius: 80,
                  label: const Text('FINISH WORK'),
                  alignLabel: const Alignment(0, 0),
                  action: () {},
                  buttonColor: const Color(0xff24282D),
                  icon: const Icon(
                    Icons.navigate_next,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

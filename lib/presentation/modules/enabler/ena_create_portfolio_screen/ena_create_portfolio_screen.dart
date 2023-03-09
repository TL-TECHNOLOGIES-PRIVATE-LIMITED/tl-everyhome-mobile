import 'package:every_home/presentation/modules/enabler/ena_main_screen/cus_main_screen.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaCreatePortfolioScreen extends StatelessWidget {
  const EnaCreatePortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262E39),
      appBar: AppBar(
        elevation: 3,
        title: const Text('Create Profile'),
        backgroundColor: const Color(0xff262E39),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "Portfolio",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              "Attach images for your completed jobs",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 14.h),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 27.h),
            Text(
              "Hourly Rates",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            const CustomFormField(
              hintText: 'Hourly Rate',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
        child: CustomYellowButton(
          label: 'Continue',
          bgColor: const Color(0xffFFA610),
          labelColor: Colors.white,
          onPress: () {
            //TODO book worker authentication
            // log(cusAddressContoller.text.toString());
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => EnaMainScreen())));
          },
        ),
      ),
    );
  }
}

import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaProfileCreateScreen extends StatelessWidget {
  const EnaProfileCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262E39),
      appBar: AppBar(
        elevation: 3,
        title: const Text('Create Profile'),
        backgroundColor: const Color(0xff262E39),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            const CustomFormField(hintText: 'Job Title'),
            SizedBox(height: 17.h),
            const CustomFormField(hintText: 'Contact Number'),
            SizedBox(height: 12.h),
            Text(
              "Add Your Skill",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12.h),
            const CustomFormField(
              hintText: 'Skills',
              maxLines: 2,
              minLines: 2,
            ),
            SizedBox(height: 40.h),
            Text(
              "Work Experience",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            const CustomFormField(
              hintText: 'Work Experience',
              maxLines: 4,
              minLines: 3,
            ),
            SizedBox(height: 20.h),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            const CustomFormField(
              hintText: 'Add Description',
              maxLines: 4,
              minLines: 3,
            ),
            SizedBox(height: 77.h),
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
            Navigator.of(context).pushNamed('/ena_create_portfolio_screen');
          },
        ),
      ),
    );
  }
}

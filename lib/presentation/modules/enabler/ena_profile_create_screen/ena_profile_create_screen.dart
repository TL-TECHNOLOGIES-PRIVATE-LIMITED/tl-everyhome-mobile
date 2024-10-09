import 'package:every_home/presentation/modules/enabler/ena_profile_create_screen/widgets/skillselector.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaProfileCreateScreen extends StatelessWidget {
  const EnaProfileCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff262E39),
        appBar: AppBar(
          elevation: 3,
          title: const Text(
            'Create Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: const Color(0xff262E39),
        ),
        body: Stack(
          children: [
            Image.asset('assets/bg_images/background_image_1.png'),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
              child: SingleChildScrollView(
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
                    SkillSelector(),
                    // const CustomFormField(
                    //   hintText: 'Skills',
                    //   maxLines: 2,
                    //   minLines: 2,
                    // ),
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
            ),
          ],
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
      ),
    );
  }
}

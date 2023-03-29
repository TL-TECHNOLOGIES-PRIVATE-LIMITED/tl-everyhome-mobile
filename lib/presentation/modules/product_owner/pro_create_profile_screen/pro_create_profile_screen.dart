import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProCreateProfileScreen extends StatelessWidget {
  const ProCreateProfileScreen({super.key});

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
          title: const Text('Create Profile'),
          backgroundColor: const Color(0xff262E39),
        ),
        body: Stack(
          children: [
            // Image.asset('assets/bg_images/background_image_1.png'),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/bg_images/enabler_bg1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(10.r)),
                  color: LigthColor().bgColorGreyGradient,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        const CustomFormField(hintText: 'Business Name'),
                        SizedBox(height: 17.h),
                        const CustomFormField(hintText: 'Contact Number'),
                        SizedBox(height: 12.h),
                        Text(
                          "Add Category",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const CustomFormField(
                          hintText: 'Add here',
                          maxLines: 2,
                          minLines: 2,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Add upto 5 categories',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Product Details",
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
                        SizedBox(height: 30.h),
                        Center(
                          child: CustomYellowButton(
                            label: 'Continue',
                            bgColor: const Color(0xffFFA610),
                            labelColor: Colors.white,
                            onPress: () {
                              //TODO book worker authentication
                              // log(cusAddressContoller.text.toString());
                              Navigator.of(context)
                                  .pushNamed('/pro_main_screen');
                            },
                          ),
                        ),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
        //   child: CustomYellowButton(
        //     label: 'Continue',
        //     bgColor: const Color(0xffFFA610),
        //     labelColor: Colors.white,
        //     onPress: () {
        //       //TODO book worker authentication
        //       // log(cusAddressContoller.text.toString());
        //       Navigator.of(context).pushNamed('/pro_main_screen');
        //     },
        //   ),
        // ),
      ),
    );
  }
}

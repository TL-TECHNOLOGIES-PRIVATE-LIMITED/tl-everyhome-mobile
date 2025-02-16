import 'package:every_home/presentation/modules/enabler/ena_create_portfolio_screen/widgets/custom_ena_portfolio_image_container.dart';
import 'package:every_home/presentation/modules/enabler/ena_main_screen/cus_main_screen.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaCreatePortfolioScreen extends StatelessWidget {
  const EnaCreatePortfolioScreen({super.key});

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
                    const CustomEnaPortfolioImageContainer(),
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
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: const CustomFormField(
                            hintText: 'Hourly Rate',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '/hr',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => EnaMainScreen())));
            },
          ),
        ),
      ),
    );
  }
}

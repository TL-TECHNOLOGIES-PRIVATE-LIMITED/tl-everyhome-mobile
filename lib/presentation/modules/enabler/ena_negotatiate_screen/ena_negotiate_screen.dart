import 'package:every_home/presentation/modules/enabler/widgets/custom_ena_job_details_card.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slider_button/slider_button.dart';

class EnaNegotiateScreen extends StatelessWidget {
  const EnaNegotiateScreen({super.key});

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
          title: const Text('Negotiate'),
          backgroundColor: const Color(0xff262E39),
          actions: const [Icon(Icons.more_vert)],
        ),
        body: Stack(
          children: [
            Image.asset('assets/bg_images/background_image_1.png'),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomEnaJobDetailsCard(),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const CustomFormField(
                        hintText: 'Type description',
                        maxLines: 4,
                        minLines: 4,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const Text(
                        'Type your amount',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 150.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            // focusedBorder: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color(0xFF353D4A),
                            border: InputBorder.none,
                            // prefixIcon: Text(
                            //   ' ₹ ',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 35,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            hintText: '0.00',
                            prefixIconConstraints:
                                BoxConstraints(minWidth: 0, minHeight: 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 206.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SliderButton(
                          height: 60,
                          width: 280.w,
                          backgroundColor: const Color(0xffFFA610),
                          radius: 80,
                          label: const Text('SWIPE TO CONFIRM'),
                          alignLabel: Alignment(0.25.w, 0),
                          action: () async {},
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
            ),
          ],
        ),
      ),
    );
  }
}

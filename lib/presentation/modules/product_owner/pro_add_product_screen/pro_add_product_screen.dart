import 'package:every_home/presentation/modules/product_owner/pro_add_product_screen/widgets/custom_pro_range_slider.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

class ProAddProductScreen extends StatelessWidget {
  const ProAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product Details'),
        ),
        backgroundColor: const Color(0xFF252C35),
        body: Stack(
          children: [
            Image.asset('assets/bg_images/background_image_1.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Add Description',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const CustomFormField(
                      hintText: 'Type Here',
                      maxLines: 4,
                      minLines: 4,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Minimum 50 and maximum 200 characters.',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Price Range',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Use slider or enter min and max price',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomProRangeSliderContainer(),
                    SizedBox(height: 30.h),
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
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.w, bottom: 45.h),
          child: CustomYellowButton(
            onPress: () {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: "Product added successfully",
                  onConfirmBtnTap: () {
                    Navigator.of(context)
                        .pushNamed('/pro_product_showcase_screen');
                  });
            },
            label: 'Submit',
            bgColor: const Color(0xffFFA610),
          ),
        ),
      ),
    );
  }
}

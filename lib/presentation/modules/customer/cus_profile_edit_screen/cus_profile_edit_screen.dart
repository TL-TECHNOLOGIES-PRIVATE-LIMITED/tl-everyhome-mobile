import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/pick_image_integration/image_picker_helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_form_field.dart';

ValueNotifier<File?> customerimage = ValueNotifier<File?>(null);

class CusProfileEditScreen extends StatelessWidget {
  const CusProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.arrow_back_ios_new),
          // ),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: const Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150.w),
                  child: Stack(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: customerimage,
                        builder: (context, value, child) {
                          return Container(
                            height: 90.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.amber,
                                width: 2,
                              ),
                            ),
                            child: value != null
                                ? ClipOval(
                                    child: Image.file(
                                      value,
                                      fit: BoxFit.cover,
                                      width: 90.w,
                                      height: 90.h,
                                    ),
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 60, // Placeholder icon size
                                    color: Colors.white,
                                  ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final File? image =
                                await ImagePickerHelper().pickImage(context);
                            customerimage.value = image;
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 22.h),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                const CustomFormField(
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                const CustomFormField(
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Mobile',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                const CustomFormField(
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                const CustomFormField(
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  minLines: 3,
                  maxLines: 4,
                ),
                SizedBox(height: 120.h),
                Center(
                  child: CustomYellowButton(
                    label: 'Update Profile',
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

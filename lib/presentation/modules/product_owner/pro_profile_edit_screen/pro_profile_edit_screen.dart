import 'package:every_home/domain/dummy/models/dummy_bussines_model.dart';
import 'package:every_home/domain/pick_image_integration/image_picker_helper.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProProfileEditScreen extends StatelessWidget {
  ProProfileEditScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO business details recieving
    final args = ModalRoute.of(context)!.settings.arguments as DummyBussiness;
    nameController.text = args.name.toString();
    emailController.text = 'tester@gmail.com';
    mobileController.text = '9089786765';
    addressController.text = args.place.toString();
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.amber,
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            args.profilePic.toString(),
                            fit: BoxFit.cover,
                            scale: 10,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            ImagePickerHelper().pickImage(context);
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
                CustomFormField(
                  controller: nameController,
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
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
                CustomFormField(
                  controller: emailController,
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
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
                CustomFormField(
                  controller: mobileController,
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
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
                CustomFormField(
                  controller: addressController,
                  hintText: '',
                  fillColor: Colors.transparent,
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  minLines: 3,
                  maxLines: 4,
                ),
                SizedBox(height: 120.h),
                Center(
                  child: CustomYellowButton(
                    label: 'Update Profile',
                    onPress: () {},
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

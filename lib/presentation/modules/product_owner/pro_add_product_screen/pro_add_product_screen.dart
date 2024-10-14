// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:every_home/domain/pick_image_integration/pick_image_integration.dart';
import 'package:every_home/presentation/modules/product_owner/pro_add_product_screen/widgets/custom_pro_range_slider.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProAddProductScreen extends StatelessWidget {
  ProAddProductScreen({super.key});
  final ValueNotifier<File> _pickedImageNotifier = ValueNotifier(File(''));
  bool isImagePicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
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
                        ValueListenableBuilder(
                            valueListenable: _pickedImageNotifier,
                            builder: (context, data, _) {
                              if (data.path.isNotEmpty) {
                                isImagePicked = true;
                              } else {
                                isImagePicked = false;
                              }
                              return isImagePicked
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          color: Colors.white.withOpacity(0.5),
                                          child: Image.file(
                                            data,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          // log('click');
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  color: Color.fromARGB(
                                                      255, 178, 175, 175),
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //     color: const Color.fromARGB(255, 7, 7, 7)
                                                  //         .withOpacity(0.5),
                                                  //     spreadRadius: 5,
                                                  //     blurRadius: 7,
                                                  //     offset: const Offset(
                                                  //         10, 10), // changes position of shadow
                                                  //   ),
                                                  // ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 20.0,
                                                      horizontal: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Icon(
                                                          Icons.close_rounded,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Card(
                                                        child: ListTile(
                                                          leading: const Icon(Icons
                                                              .camera_alt_rounded),
                                                          title: Text(
                                                            'Capture photo',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18.sp,
                                                            ),
                                                          ),
                                                          onTap: () async {
                                                            _pickedImageNotifier
                                                                    .value =
                                                                await PickImageIntegrartion()
                                                                    .getFromCamera();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(height: 5.h),
                                                      Card(
                                                        child: ListTile(
                                                          leading: const Icon(
                                                              Icons.image),
                                                          title: Text(
                                                            'Upload Photo',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18.sp,
                                                            ),
                                                          ),
                                                          onTap: () async {
                                                            _pickedImageNotifier
                                                                    .value =
                                                                await PickImageIntegrartion()
                                                                    .getFromGallery();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          // log(image.path.toString());
                                          // _pickedImageNotifier.value = image;
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            child: const Icon(Icons.camera_alt,
                                                size: 40),
                                          ),
                                        ),
                                      ),
                                    );
                            }),
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

  File addImage(
      {required BuildContext context,
      Color backgroundColor = const Color(0xff22262B)}) {
    late File pickedImage;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: const Color.fromARGB(255, 7, 7, 7)
            //         .withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(
            //         10, 10), // changes position of shadow
            //   ),
            // ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(height: 10.h),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.camera_alt_rounded),
                    title: Text(
                      'Capture picture',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    onTap: () async {
                      pickedImage =
                          await PickImageIntegrartion().getFromCamera();
                    },
                  ),
                ),
                SizedBox(height: 5.h),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.image),
                    title: Text(
                      'Upload picture from Photos',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    onTap: () async {
                      pickedImage =
                          await PickImageIntegrartion().getFromGallery();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
    return pickedImage;
  }
}

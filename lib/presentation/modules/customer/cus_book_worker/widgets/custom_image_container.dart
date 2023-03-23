import 'package:every_home/domain/pick_image_integration/image_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            ImagePickerHelper().pickImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffDEDEDE),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ImagePickerHelper().pickImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffDEDEDE),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ImagePickerHelper().pickImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffDEDEDE),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ImagePickerHelper().pickImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffDEDEDE),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

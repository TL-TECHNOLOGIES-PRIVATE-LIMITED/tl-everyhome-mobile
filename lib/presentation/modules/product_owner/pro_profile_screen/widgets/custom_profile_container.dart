import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomProProfileContainer extends StatefulWidget {
  const CustomProProfileContainer({
    super.key,
    required this.customerName,
    required this.customerProfilePic,
  });

  final String customerName;
  final String customerProfilePic;

  @override
  State<CustomProProfileContainer> createState() =>
      _CustomProProfileContainerState();
}

class _CustomProProfileContainerState extends State<CustomProProfileContainer> {
  late File imageFile;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        // height: 250.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff22262B),
              Color(0xFF252E39),
            ],
          ),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          SizedBox(
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //TODO edit option need to implemented
                  },
                  icon: const Icon(
                    Icons.mode_edit_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              const CircleAvatar(
                // backgroundImage: AssetImage(customerProfilePic),
                radius: 50,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    _getFromCamera();
                  },
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: const BoxDecoration(
                      color: Color(0xffFEBA45),
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
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              widget.customerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }
}

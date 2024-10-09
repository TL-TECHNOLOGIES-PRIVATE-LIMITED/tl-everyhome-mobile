import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  Future<File?> pickImage(BuildContext context, {String? title}) async {
    return await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return Container(
            height: 0.2.sh,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? 'Pick Image',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LabelIconButton(
                      icon: Icons.camera_alt,
                      label: 'Camera',
                      onPress: () {
                        _choosePhoto(ImageSource.camera)
                            .then((file) => Navigator.of(context).pop(file));
                      },
                      iconColor: Colors.amber,
                    ),
                    _LabelIconButton(
                      icon: Icons.image,
                      label: 'Gallery',
                      onPress: () {
                        _choosePhoto(ImageSource.gallery)
                            .then((file) => Navigator.of(context).pop(file));
                      },
                      iconColor: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<File?> _choosePhoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 500);

    if (image == null) return null;
    File imageFile = File(image.path);
    return imageFile;
  }
}

class _LabelIconButton extends StatelessWidget {
  const _LabelIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPress,
    required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final Color iconColor;
  final String label;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 80,
        height: 100,
        child: TextButton(
          onPressed: () {
            onPress();
          },
          style: TextButton.styleFrom(
            foregroundColor: iconColor.withOpacity(0.1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

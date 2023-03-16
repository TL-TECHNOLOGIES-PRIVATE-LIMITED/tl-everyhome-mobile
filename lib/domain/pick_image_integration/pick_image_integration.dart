import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImageIntegrartion {
  /// Get from gallery
  Future<File> getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    var imageFile = File(pickedFile!.path);
    return imageFile;
  }

  /// Get from Camera
  Future<File> getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    var imageFile = File(pickedFile!.path);
    return imageFile;
  }
}

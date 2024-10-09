import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../domain/pick_image_integration/image_picker_helper.dart';

class CustomEnaWorkersImages extends StatefulWidget {
  const CustomEnaWorkersImages({
    super.key,
  });

  @override
  State<CustomEnaWorkersImages> createState() => _CustomEnaWorkersImagesState();
}

class _CustomEnaWorkersImagesState extends State<CustomEnaWorkersImages> {
  List<File?> images = List.filled(3, null); // List to hold image files

  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  Future<void> _pickImage(int index) async {
    final File? imageFile = await _imagePickerHelper.pickImage(
      context,
      title: 'Pick an Image',
    );

    if (imageFile != null) {
      setState(() {
        images[index] = imageFile; // Update the image file in the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _pickImage(index), // Open image picker on tap
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: images[index] != null
                      ? Image.file(
                          images[index]!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.camera_alt,
                          size: 40), // Show camera icon if no image is picked
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ena_profile_edit_screen/ena_profile_edit_screen.dart';

class CustomEnaProfileContainer extends StatelessWidget {
  const CustomEnaProfileContainer({
    super.key,
    required this.customerName,
  });

  final String customerName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        height: 250.h, // Set a fixed height
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff22262B),
              Color(0xFF252E39),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max, // Change to MainAxisSize.max
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
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
                      Navigator.of(context)
                          .pushNamed('/ena_profile_edit_screen');
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
              alignment: Alignment.center, // Align items centrally
              children: [
                ValueListenableBuilder(
                  valueListenable: EnprofileimgListener,
                  builder: (context, value, child) {
                    return CircleAvatar(
                      radius: 40,
                      backgroundImage: value != null
                          ? FileImage(value)
                          : AssetImage('assets/persons/person3.jfif')
                              as ImageProvider<Object>?,
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      // Your image picking logic here
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
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                customerName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

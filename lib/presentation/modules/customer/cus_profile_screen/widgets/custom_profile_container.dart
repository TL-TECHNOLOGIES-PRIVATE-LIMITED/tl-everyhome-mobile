import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: Container(
        height: 307.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff22262B),
              Color(0xFF252E39),
            ],
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            child: SizedBox(
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mode_edit_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).viewPadding.top,
            child: Align(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
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
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
          Positioned.fill(
            top: 240.h,
            child: Align(
              child: Text(
                'Samuel john',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

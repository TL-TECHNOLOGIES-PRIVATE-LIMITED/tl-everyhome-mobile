import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEnaProfileContainer extends StatelessWidget {
  const CustomEnaProfileContainer({
    super.key,
    required this.customerName,
    required this.customerProfilePic,
  });

  final String customerName;
  final String customerProfilePic;

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
                    Navigator.of(context).pushNamed('/ena_profile_edit_screen');
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
              CircleAvatar(
                backgroundImage: AssetImage(customerProfilePic),
                radius: 50,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    // showBottomSheet(
                    //     context: context,
                    //     builder: (context) {
                    //       return ClipRRect(
                    //         borderRadius: const BorderRadius.only(
                    //             topLeft: Radius.circular(20),
                    //             topRight: Radius.circular(20)),
                    //         child: Container(
                    //           decoration: const BoxDecoration(
                    //             color: Color(0xff22262B),
                    //             // boxShadow: [
                    //             //   BoxShadow(
                    //             //     color: const Color.fromARGB(255, 7, 7, 7)
                    //             //         .withOpacity(0.5),
                    //             //     spreadRadius: 5,
                    //             //     blurRadius: 7,
                    //             //     offset: const Offset(
                    //             //         10, 10), // changes position of shadow
                    //             //   ),
                    //             // ],
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.symmetric(
                    //                 vertical: 20.0, horizontal: 20),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 GestureDetector(
                    //                   onTap: () {
                    //                     Navigator.of(context).pop();
                    //                   },
                    //                   child: const Icon(
                    //                     Icons.close_rounded,
                    //                     color: Colors.white,
                    //                     size: 24,
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 10.h),
                    //                 Card(
                    //                   child: ListTile(
                    //                     leading: const Icon(
                    //                         Icons.camera_alt_rounded),
                    //                     title: Text(
                    //                       'Capture picture',
                    //                       style: TextStyle(
                    //                         color: Colors.black,
                    //                         fontSize: 18.sp,
                    //                       ),
                    //                     ),
                    //                     onTap: () {
                    //                       PickImageIntegrartion()
                    //                           .getFromCamera();
                    //                     },
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 5.h),
                    //                 Card(
                    //                   child: ListTile(
                    //                     leading: const Icon(Icons.image),
                    //                     title: Text(
                    //                       'Upload picture from Photos',
                    //                       style: TextStyle(
                    //                         color: Colors.black,
                    //                         fontSize: 18.sp,
                    //                       ),
                    //                     ),
                    //                     onTap: () {
                    //                       PickImageIntegrartion()
                    //                           .getFromGallery();
                    //                     },
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     });
                  },
                  // child: Container(
                  //   height: 35.h,
                  //   width: 35.w,
                  //   decoration: const BoxDecoration(
                  //     color: Color(0xffFEBA45),
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: const Center(
                  //     child: Icon(
                  //       Icons.camera_alt_outlined,
                  //       color: Colors.black,
                  //       size: 18,
                  //     ),
                  //   ),
                  // ),
                ),
              )
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
        ]),
      ),
    );
  }
}

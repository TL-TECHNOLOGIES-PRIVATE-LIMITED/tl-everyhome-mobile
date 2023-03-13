import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProShowProductsScreen extends StatelessWidget {
  const ProShowProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        automaticallyImplyLeading: false,
        title: const Text('Product Showcase'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Text(
                'Product Showcase is empty!',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff252E38),
                ),
              ),
            ),
            SizedBox(height: 100.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFFA610),
                minimumSize: Size(256.w, 62.w),
              ),
              child: Wrap(
                spacing: 5.w,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 24.sp,
                    color: const Color(0xff252E38),
                  ),
                  Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff252E38),
                    ),
                  ),
                ],
              ),
            )
            // SvgPicture.asset(
            //   'assets/polygons/empty_product.svg',
            //   theme: const SvgTheme(currentColor: Colors.black),
            // ),
          ],
        ),
      ),
    );
  }
}

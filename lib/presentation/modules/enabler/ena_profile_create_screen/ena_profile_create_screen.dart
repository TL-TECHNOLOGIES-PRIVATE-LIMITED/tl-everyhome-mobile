import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaProfileCreateScreen extends StatelessWidget {
  const EnaProfileCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262E39),
      appBar: AppBar(
        elevation: 3,
        title: const Text('Job Details'),
        backgroundColor: const Color(0xff262E39),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            
          ],
        ),
      ),
    );
  }
}

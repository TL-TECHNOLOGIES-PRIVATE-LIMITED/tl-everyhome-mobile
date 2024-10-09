import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutList extends StatelessWidget {
  const AboutList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Electrician',
              style: TextStyle(
                color: const Color(0xff252C35),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Installing, maintaining, and repairing electrical control, wiring, and lighting systems. Reading technical diagrams and blueprints. Performing general electrical maintenance. Inspecting transformers, circuit breakers, and other electrical components. Troubleshooting electrical issues using appropriate testing devices.',
            style: TextStyle(
              color: const Color(0xff252C35),
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Other Skills',
              style: TextStyle(
                color: const Color(0xff252C35),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: 4,
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 2,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Chip(
                  shadowColor: Colors.black,
                  elevation: 4,
                  backgroundColor: Colors.transparent,
                  label: Text('Electrician'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

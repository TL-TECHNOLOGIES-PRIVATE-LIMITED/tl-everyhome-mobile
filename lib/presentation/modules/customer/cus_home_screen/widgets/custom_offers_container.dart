import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOffersContainer extends StatelessWidget {
  const CustomOffersContainer({
    super.key,
    required this.offerImage,
  });
  final String offerImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.15.sh,
      width: 1.sw,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(offerImage),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slider_button/slider_button.dart';

class CustomEnaSliderButton extends StatelessWidget {
  const CustomEnaSliderButton({
    super.key,
    required this.onSlide,
  });
  final Function onSlide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SliderButton(
          // dismissible: false,
          height: 60,
          width: 280.w,
          backgroundColor: const Color(0xffFFA610),
          radius: 80,
          label: const Text('SWIPE TO CONFIRM'),
          alignLabel: Alignment(0.25.w, 0),
          action: () async {},
          buttonColor: const Color(0xff24282D),
          icon: const Icon(
            Icons.navigate_next,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

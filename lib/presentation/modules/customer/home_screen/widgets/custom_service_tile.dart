
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomServicesTile extends StatelessWidget {
  const CustomServicesTile({
    super.key,
    required this.icon,
    required this.serviceName,
  });
  final String icon;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      color: const Color(0xffD9D9D9),
      child: Center(
        child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SvgPicture.asset(icon),
              Text(
                serviceName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ]),
      ),
    );
  }
}

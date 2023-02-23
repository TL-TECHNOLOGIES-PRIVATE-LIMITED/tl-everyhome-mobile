import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
  });
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xffE8E8E8),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffBDBDBD),
          ),
        ),
      ),
    );
  }
}

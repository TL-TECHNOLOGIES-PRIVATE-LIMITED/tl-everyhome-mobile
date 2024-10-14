import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class CustomAddressField extends StatelessWidget {
  CustomAddressField({
    super.key,
    this.controller,
  });

  final ValueNotifier<bool> editTextFieldNotifier = ValueNotifier(true);
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: editTextFieldNotifier,
      builder: (context, value, _) {
        return CustomFormField(
          controller: controller,
          prefixIcon: const Icon(
            Icons.home,
            color: Color(0xffFEBA45),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              editTextFieldNotifier.value = !editTextFieldNotifier.value;
            },
            child: const Icon(
              Icons.edit_location_alt_outlined,
              color: Colors.grey,
            ),
          ),
          hintText: 'Enter your address',
          maxLines: 5,
          readOnly: value,
          minLines: 4,
          initialValue:
              'Trivandrum, Nedumangadu,\n9876897867,\nKerala 695581, \nIndia',
        );
      },
    );
  }
}

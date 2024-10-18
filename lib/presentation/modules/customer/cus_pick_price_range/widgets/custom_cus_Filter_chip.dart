import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCusFilterChip extends StatelessWidget {
  final String? type;
  final ValueNotifier<int?> selectedIndexNotifier;

  const CustomCusFilterChip({
    super.key,
    this.type,
    required this.selectedIndexNotifier,
  });

  @override
  Widget build(BuildContext context) {
    // Define the options based on the type
    List<String> options = type == 'rate'
        ? ['5-4', '4-3', '3-2', '2-1']
        : ['5Km', '10Km', '15Km', '15Km+'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            type == 'rate' ? 'Ratings' : 'Distances',
            style: TextStyle(
              color: const Color(0xff252C35),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 8,
            spacing: 40,
            children: List.generate(options.length, (index) {
              String option = options[index];
              return ValueListenableBuilder<int?>(
                valueListenable: selectedIndexNotifier,
                builder: (context, selectedIndex, _) {
                  return ChoiceChip(
                    shape: const RoundedRectangleBorder(),
                    label: Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          option,
                          style: TextStyle(
                            color: const Color(0xff252C35),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        type == 'rate'
                            ? const Icon(Icons.star, color: Colors.black)
                            : const SizedBox(),
                      ],
                    ),
                    selected: selectedIndex == index,
                    shadowColor: Colors.black,
                    elevation: 10,
                    backgroundColor: Colors.white12,
                    selectedColor: const Color(0xffFFA610),
                    onSelected: (selected) {
                      selectedIndexNotifier.value = selected ? index : null;
                    },
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}

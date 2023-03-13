import 'package:flutter/material.dart';

class CustomProNotificationViewAllBadge extends StatelessWidget {
  const CustomProNotificationViewAllBadge({
    super.key,
    required this.searchTitle,
    this.onPress,
    this.viewAll,
  });
  final String searchTitle;
  final void Function()? onPress;
  final String? viewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            searchTitle,
            style: const TextStyle(
              color: Color(0xff231E1E),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onPress,
            child: Text(
              viewAll ?? '',
              style: const TextStyle(
                color: Color(0xff231E1E),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

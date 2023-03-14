
import 'package:flutter/material.dart';

class CustomEnaPortfolioImageContainer extends StatelessWidget {
  const CustomEnaPortfolioImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.camera_alt, size: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.camera_alt, size: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.camera_alt, size: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.camera_alt, size: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.camera_alt, size: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: const Icon(Icons.camera_alt, size: 40),
            ),
          ),
        ),
      ],
    );
  }
}

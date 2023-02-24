import 'package:flutter/material.dart';

class CusFavouritesScreen extends StatelessWidget {
  const CusFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favourites'),
      ),
      body: const Center(
        child: Text('Favourites Screen'),
      ),
    );
  }
}

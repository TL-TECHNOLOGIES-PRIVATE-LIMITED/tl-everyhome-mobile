import 'package:flutter/material.dart';

class CusWalletScreen extends StatelessWidget {
  const CusWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Wallet'),
      ),
      body: const Center(
        child: Text('Wallet Screen'),
      ),
    );
  }
}

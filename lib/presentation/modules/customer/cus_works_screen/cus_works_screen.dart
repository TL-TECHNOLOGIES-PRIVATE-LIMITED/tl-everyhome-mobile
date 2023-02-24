import 'package:flutter/material.dart';

class CusWorksScreeen extends StatelessWidget {
  const CusWorksScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Work Lists'),
      ),
      body: const Center(
        child: Text('Works Screen'),
      ),
    );
  }
}

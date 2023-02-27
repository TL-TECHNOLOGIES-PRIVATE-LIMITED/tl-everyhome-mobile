import 'package:flutter/material.dart';

class CusBookWorker extends StatelessWidget {
  const CusBookWorker({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.toString()),
      ),
      // body: ,
    );
  }
}

import 'package:every_home/presentation/main_app.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => const MainApp(), // Wrap your app
  // ));
}

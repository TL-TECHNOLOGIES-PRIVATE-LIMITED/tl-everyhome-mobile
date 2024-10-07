import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MainApp());
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => const MainApp(), // Wrap your app
  // ));
}

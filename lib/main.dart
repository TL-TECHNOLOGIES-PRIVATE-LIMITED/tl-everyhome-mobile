import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/main_app.dart';

// <======================================== NOTES START ==============================================>

// Libraries used :   "tailwind-css" for css
// Read the documentaion in their respective sites for the above mentioned libraries before making changes in the code.
// To run the code: npm start
// First install all dependencies :- npm intsall
// Then run the code :- npm start

// created date : 06-MAY-2024 || created by : Murthasa Ali  || module : 1 ||
// modified date : 05/09/2024 || modified by : Murthasa ALi || module : 1 ||
// modified date : 24/09/2024 || modified by : Murthasa Ali ck  || module : 1 ||

// Technical summary(Pre-setups) created date/by :  Murthasa Ali ||
// Domain :   ||
// Hosting :   ||
// SSL :   ||
// Database :  ||

// Phase summary :   || created date/by :  Ali  ||
// Phase 1 :  SetUps ||
// Phase 2 :  Development/Main page creation ||
// Phase 3 :  Production  ||

// <======================================== NOTES END ==============================================>

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

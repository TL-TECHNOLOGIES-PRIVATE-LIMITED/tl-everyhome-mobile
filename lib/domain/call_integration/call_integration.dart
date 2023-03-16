import 'package:url_launcher/url_launcher.dart';

class CallIntegration {
  Future<bool> callToAction({String phoneNumber = '+91 0000 00 0000'}) async {
    if (await canLaunchUrl(Uri(scheme: 'tel', path: '123'))) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(
        launchUri,
        mode: LaunchMode.externalApplication,
      );
      return true;
    } else {
      return false;
    }
  }
}

import 'package:url_launcher/url_launcher.dart';

class MessageIntegration {
  Future<bool> messageToAction(
      {String phoneNumber = '+91 0000 00 0000'}) async {
    // Android
    const uri = 'sms:+39 348 060 888?body=hello%20there';
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
      return true;
    } else {
      // iOS
      const uri = 'sms:0039-222-060-888?body=hello%20there';
      if (await canLaunchUrl(Uri.parse(uri))) {
        await launchUrl(Uri.parse(uri));
        return true;
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CusWalletScreen extends StatelessWidget {
  const CusWalletScreen({super.key});

  // UPI URL to redirect to Google Pay with pre-filled details
  final String upiUrl =
      'upi://pay?pa=aseemmtk@oksbi&pn=Aseem&am=100.00&cu=INR&tn=Wallet Payment';

  // Alternative Intent URL for UPI payments (using correct package name)
  final String upiIntentUrl =
      'intent://pay?pa=aseemmtk@oksbi&pn=Aseem&am=100.00&cu=INR&tn=Wallet%20Payment#Intent;scheme=upi;package=com.google.android.apps.nbu.paisa.user;end';

  // Function to open Google Pay with the UPI payment details
  void _launchGooglePay(BuildContext context) async {
    final Uri uri = Uri.parse(upiUrl); // Convert the string to Uri
    final Uri intentUri = Uri.parse(upiIntentUrl); // Intent URL

    // Log the URIs for debugging
    print('UPI URL: $upiUrl');
    print('Intent URL: $upiIntentUrl');

    // Check if any UPI app is available to handle the URI
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      print('Launching UPI URL: $uri');
    } else if (await canLaunchUrl(intentUri)) {
      await launchUrl(intentUri); // Use intent URL as a fallback
      print('Launching Intent URL: $intentUri');
    } else {
      // No UPI apps available
      print(
          'No UPI apps available to handle this URI. Check if UPI apps are installed and configured correctly.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Could not launch Google Pay. Please check if it is installed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Wallet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              _launchGooglePay(context), // Redirect to Google Pay when clicked
          child: const Text('Pay with Google Pay'),
        ),
      ),
    );
  }
}

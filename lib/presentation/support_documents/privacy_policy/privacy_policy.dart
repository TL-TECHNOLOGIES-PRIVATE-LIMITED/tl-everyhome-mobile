import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pivacy Policy'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: Future.delayed(const Duration(milliseconds: 150))
                          .then((value) {
                        return rootBundle
                            .loadString('assets/documents/privacy_policy.md');
                      }),
                      builder: (constex, snapshot) {
                        if (snapshot.hasData) {
                          return Markdown(data: snapshot.data.toString());
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

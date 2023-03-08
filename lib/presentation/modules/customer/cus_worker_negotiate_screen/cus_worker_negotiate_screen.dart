import 'package:every_home/presentation/modules/customer/cus_worker_negotiate_screen/widgets/custom_negotiate_appbar.dart';
import 'package:every_home/presentation/modules/customer/cus_worker_negotiate_screen/widgets/custom_negotiate_bottom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusWorkerNegotiateScreen extends StatelessWidget {
  const CusWorkerNegotiateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomNegotiateAppBar(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'About Work',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    'Installing, maintaining, and repairing electrical control, wiring, and lighting systems. Reading technical diagrams and blueprints. Performing general electrical maintenance. Inspecting transformers, circuit breakers, and other electrical components. Troubleshooting electrical issues using appropriate testing devices.',
                    style: TextStyle(
                      color: const Color(0xff252C35),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Negotiate',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  CustomFormField(
                    hintText: 'Enter your amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: false,
                  ),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: const CustomNegotiateBottomButton(),
      ),
    );
  }
}

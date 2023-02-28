import 'dart:developer';

import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/modules/customer/cus_book_worker/widgets/custom_image_container.dart';
import 'package:every_home/presentation/modules/customer/cus_book_worker/widgets/custom_title_text.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusBookWorker extends StatefulWidget {
  const CusBookWorker({super.key});

  @override
  State<CusBookWorker> createState() => _CusBookWorkerState();
}

class _CusBookWorkerState extends State<CusBookWorker> {
  final formGlobalKey = GlobalKey<FormState>();

  final ValueNotifier<bool> editTextFieldNotifier = ValueNotifier(true);

  final TextEditingController issueTypeContoller = TextEditingController();

  final TextEditingController issueDescriptionContoller =
      TextEditingController();

  final TextEditingController cusAddressContoller = TextEditingController();
  @override
  void initState() {
    super.initState();
    cusAddressContoller.text =
        'Trivandrum, Nedumangadu,\n9876897867,\nKerala 695581, \nIndia';
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: LigthColor().bgColorGrey,
        appBar: AppBar(
          elevation: 0,
          title: Text(args.toString()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitleText(
                  title: 'Issue Type',
                ),
                CustomFormField(
                  hintText: 'ex:fan installation',
                  controller: issueTypeContoller,
                ),
                const CustomTitleText(title: 'Issue Description'),
                CustomFormField(
                  hintText: 'ex: Installation of new fan',
                  maxLines: 5,
                  minLines: 4,
                  controller: issueDescriptionContoller,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Container(
                //       height: 60.h,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Colors.amber,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const CustomTitleText(title: 'Images'),
                const CustomImageContainer(),
                const CustomTitleText(title: 'Select Address'),
                ValueListenableBuilder(
                  valueListenable: editTextFieldNotifier,
                  builder: (context, value, _) {
                    return CustomFormField(
                      controller: cusAddressContoller,
                      // onChanged: (value) {
                      //   cusAddressContoller.text = value;
                      // },
                      prefixIcon: const Icon(
                        Icons.home,
                        color: Color(0xffFEBA45),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          editTextFieldNotifier.value =
                              !editTextFieldNotifier.value;
                        },
                        child: const Icon(
                          Icons.edit_location_alt_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'Enter your address',
                      maxLines: 5,
                      readOnly: value,
                      minLines: 4,
                      // initialValue:
                      //     'Trivandrum, Nedumangadu,\n9876897867,\nKerala 695581, \nIndia',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
          child: CustomYellowButton(
            label: 'Pick your Date and Time',
            bgColor: const Color(0xffFFA610),
            labelColor: const Color(0xffF0E8E8),
            onPress: () {
              //TODO book worker authentication
              log(cusAddressContoller.text.toString());
            },
          ),
        ),
      ),
    );
  }
}

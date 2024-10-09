import 'dart:developer';

import 'package:every_home/const.dart';
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

  final FocusNode onFocus = FocusNode();

  bool focusField = false;
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          title: Text(
            args.toString(),
            style: Appbartextstyle,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Image.asset(
                'assets/bg_images/background_image_1.png',
                height: 0.7.sh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTitleText(
                      title: 'Issue type',
                    ),
                    CustomFormField(
                      hintText: 'eg:fan installation',
                      controller: issueTypeContoller,
                    ),
                    const CustomTitleText(title: 'Issue description'),
                    CustomFormField(
                      hintText: 'eg: Installation of new fan',
                      maxLines: 5,
                      minLines: 4,
                      controller: issueDescriptionContoller,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Min 5 words',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const CustomTitleText(
                      title: 'Add Audio Instruction',
                    ),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.mic),
                        ),
                      ),
                    ),
                    // CustomFormField(
                    //   hintText: '0.00',
                    //   controller: issueTypeContoller,
                    // ),
                    const ExpansionPanelList(
                      children: [],
                    ),
                    const CustomTitleText(title: 'Edit address'),
                    ValueListenableBuilder(
                      valueListenable: editTextFieldNotifier,
                      builder: (context, value, _) {
                        return CustomFormField(
                          focusNode: onFocus,
                          controller: cusAddressContoller,
                          autofocus: focusField,
                          prefixIcon: const Icon(
                            Icons.home,
                            color: Color(0xffFEBA45),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                editTextFieldNotifier.value =
                                    !editTextFieldNotifier.value;
                                onFocus.requestFocus();
                              },
                              child: editTextFieldNotifier.value
                                  ? Icon(Icons.edit_outlined,
                                      size: 24.r, color: Colors.grey)
                                  : Icon(Icons.edit_off_outlined,
                                      size: 24.r, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          hintText: 'Enter your address',
                          maxLines: 5,
                          readOnly: value,
                          minLines: 4,
                        );
                      },
                    ),
                    const CustomTitleText(title: 'Add snapshots'),
                    const CustomImageContainer(),
                    SizedBox(height: 39.h),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, bottom: 50.h),
                      child: CustomYellowButton(
                        label: 'Pick your Date and Time',
                        onPress: () {
                          //TODO book worker authentication
                          log(cusAddressContoller.text.toString());
                          Navigator.of(context)
                              .pushNamed('/date_and_time_screen');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:every_home/domain/map_integration/map_integration.dart';
import 'package:every_home/domain/message_integration/message_integration.dart';
import 'package:every_home/presentation/modules/login/google_map_screen/widgets/custom_adress_container.dart';
import 'package:every_home/presentation/modules/login/google_map_screen/widgets/custom_web_view.dart';

import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Import for Android features.
// Import for iOS features.

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  final Map<String, dynamic>? currentAdress = {};
  bool isFetchCurentAddress = false;
  bool isAddAddress = false;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomWebWiew(latitude: '8.5799533', longitude: '76.8632717'),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 428.w,
                // height: 363.h,
                decoration: BoxDecoration(
                  color: const Color(0xff23272C),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.r),
                      topRight: Radius.circular(22.r)),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 25.h),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // const Icon(Icons.close, color: Colors.white),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Select Address',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          isFetchCurentAddress
                              ? FutureBuilder(
                                  future: MapIntegration().getLocation(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return CustomAdressContainer(
                                          currentAdress: snapshot.data);
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                )
                              : const SizedBox(),
                          isAddAddress
                              ? Form(
                                  key: formGlobalKey,
                                  child: Column(
                                    children: [
                                      CustomFormField(
                                        hintText: 'Add Address',
                                        validator: (adress) {
                                          if (adress!.isNotEmpty) {
                                            return null;
                                          } else {
                                            return 'Please provide your Address';
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8.w,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xffFEBA45),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.add),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isAddAddress = true;
                                    isFetchCurentAddress = false;
                                  });
                                },
                                style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w)),
                                child: Text(
                                  'Add New Location',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFEBA45),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8.w,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xffFEBA45),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.location_on_outlined,
                                  size: 24,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isFetchCurentAddress = true;
                                    isAddAddress = false;
                                  });
                                },
                                child: Text(
                                  'Use Current Location',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFEBA45),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Center(
                            child: CustomYellowButton(
                              label: 'Confirm',
                              labelColor: const Color(0xff000000),
                              onPress: () {
                                if (isAddAddress == true) {
                                  if (formGlobalKey.currentState!.validate()) {
                                    // Navigator.of(context)
                                    //     .pushNamed('/signin_screen');
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/signin_screen', (route) => false);
                                  }
                                } else if (isFetchCurentAddress == true) {
                                  Navigator.of(context)
                                      .pushNamed('/signin_screen');
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/signin_screen', (route) => false);
                                } else {
                                  Fluttertoast.showToast(
                                    toastLength: Toast.LENGTH_LONG,
                                    msg:
                                        'Please provide an address to continue',
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              },
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // CallIntegration().callToAction();
          MessageIntegration().messageToAction();
        },
        child: const Icon(Icons.local_activity),
      ),
    );
  }
}

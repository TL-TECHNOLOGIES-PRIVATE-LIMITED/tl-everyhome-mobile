import 'package:every_home/domain/map_integration/map_integration.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  final Map<String, dynamic>? currentAdress = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
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
                            const Icon(Icons.close, color: Colors.white),
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
                        SizedBox(height: 17.h),
                        Text(
                          'Use Saved Address',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Container(
                            width: 360.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22.r)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 3.w,
                                        right: 5.w,
                                        top: 2.w,
                                        bottom: 2.w),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff23272C),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.r))),
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 8.w,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xffFEBA45),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            size: 18.r,
                                          ),
                                        ),
                                        Text(
                                          'Home',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xffFEBA45),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${currentAdress?['street'] ?? ''},${currentAdress?['locality'] ?? ''},\n${currentAdress?['state'] ?? ''},${currentAdress?['postal_code'] ?? ''},${currentAdress?['country'] ?? ''}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff23272C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                              child: const Icon(Icons.add),
                            ),
                            TextButton(
                              onPressed: () {},
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
                              onPressed: () async {
                                final data =
                                    await MapIntegration().getLocation();
                                setState(() {
                                  currentAdress?.addAll({...data});
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
                              Navigator.of(context).pushNamed('/signin_screen');
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     MapIntegration().getDirection();
      //   },
      //   child: const Icon(Icons.local_activity),
      // ),
    );
  }
}

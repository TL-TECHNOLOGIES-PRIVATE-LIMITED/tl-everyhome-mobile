import 'package:every_home/const.dart';
import 'package:every_home/domain/call_integration/call_integration.dart';
import 'package:every_home/domain/map_integration/map_integration.dart';
import 'package:every_home/domain/message_integration/message_integration.dart';
import 'package:every_home/presentation/modules/enabler/ena_job_details_screen/widgets/custom_custom_details_tile.dart';
import 'package:every_home/presentation/modules/enabler/ena_job_details_screen/widgets/custom_ena_slider_button.dart';
import 'package:every_home/presentation/modules/enabler/widgets/action_button.dart';
import 'package:every_home/presentation/modules/enabler/widgets/custom_ena_job_details_card.dart';
import 'package:every_home/presentation/modules/enabler/widgets/custom_ena_workers_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnaJobDetailsScreen extends StatelessWidget {
  EnaJobDetailsScreen({super.key});
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier(false);

  showLoading() async {
    _isLoadingNotifier.value = true;
    await Future.delayed(const Duration(seconds: 3));
    _isLoadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    _isLoadingNotifier.value = false;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xff262E39),
          appBar: AppBar(
            elevation: 3,
            toolbarHeight: 50,
            title: Text(
              'Job Details',
              style: Appbartextstyle,
            ),
            backgroundColor: const Color(0xff262E39),
            actions: const [Icon(Icons.more_vert)],
          ),
          body: Stack(
            children: [
              Image.asset('assets/bg_images/background_image_1.png'),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomEnaJobDetailsCard(),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Snapshots',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const CustomEnaWorkersImages(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'About Customer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                showLoading();
                                MapIntegration().getDirection();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                minimumSize: Size(100.w, 40.h),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Get Direction",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff272F3A),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomCustomerDetailsTile(
                      callButton: () => CallIntegration().callToAction(),
                      msgButton: () => MessageIntegration().messageToAction(),
                    ),
                    SizedBox(height: 15.h),
                    const ActionButton(),
                    SizedBox(height: 18.h),
                    CustomEnaSliderButton(
                      onSlide: () async {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _isLoadingNotifier,
          builder: (context, value, _) {
            if (value) {
              return const Opacity(
                opacity: 0.8,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              );
            }
            return const SizedBox();
          },
        ),
        ValueListenableBuilder(
          valueListenable: _isLoadingNotifier,
          builder: (context, value, _) {
            if (value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}

import 'package:every_home/presentation/modules/customer/cus_worker_rating_screen/widgets/custom_worker_rating_appbar.dart';
import 'package:every_home/presentation/widgets/custom_button.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusWorkerRatingScreen extends StatelessWidget {
  const CusWorkerRatingScreen({super.key});

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
            const CustomWorkerRatingAppBar(),
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
                      'Review',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  CustomFormField(
                    hintText: 'Enter your review',
                    minLines: 3,
                    maxLines: 4,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                    child: Text(
                      'Rating',
                      style: TextStyle(
                        color: const Color(0xff252C35),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    unratedColor: const Color(0xffACACAC),
                    // ignoreGestures: true,
                    initialRating: 0.0,
                    allowHalfRating: true,
                    itemSize: 24,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    },
                    onRatingUpdate: (value) {},
                  ),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.h),
          child: CustomYellowButton(
            label: 'Complete Work',
            bgColor: const Color(0xffFFA610),
            labelColor: Colors.white,
            onPress: () {
              //TODO book worker authentication
              // log(cusAddressContoller.text.toString());
              Navigator.of(context).pushNamed('/cus_pick_price_range');
            },
          ),
        ),
      ),
    );
  }
}

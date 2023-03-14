
import 'package:every_home/domain/dummy/models/dummy_customer_model.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

class CustomCusHomeAppBar extends StatelessWidget {
  const CustomCusHomeAppBar({
    super.key,
    required this.cusName,
    required this.cusLocation,
    required this.customer,
    required this.profilePicture,
  });
  final String cusName;
  final String cusLocation;
  final DummyCustomer customer;
  final String profilePicture;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      snap: true,
      floating: true,
      elevation: 0,
      toolbarHeight: 90,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    //TODO customer details passing to profile page
                    Navigator.of(context)
                        .pushNamed('/cus_profile_screen', arguments: customer);
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(profilePicture),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                //TODO customer name update
                cusName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            subtitle: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/icons/location_icon.svg',
                    height: 12,
                    width: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: 160.w,
                    child: Text(
                      //TODO customer place update
                      cusLocation,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'What Service Do you Need?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/notification_screen');
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                          'assets/icons/notification_icon.svg'),
                    ),
                  ),
                  Positioned(
                    right: 0.w,
                    top: -4.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFEBA45),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('5'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
      bottom: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 55.h,
                child: const CustomFormField(
                    prefixIcon: Icon(
                      IconlyLight.search,
                      color: Colors.black,
                    ),
                    hintText: 'Search your Requirements'),
              ),
            ),
            SizedBox(width: 10.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 55.h,
                width: 55.w,
                color: Colors.white,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/filter_icon.svg',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

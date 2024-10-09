import 'package:every_home/presentation/modules/enabler/ena_home_screen/widgets/custom_progress_indicator.dart';
import 'package:every_home/presentation/modules/enabler/ena_home_screen/widgets/custom_wallet_container.dart';
import 'package:every_home/presentation/modules/enabler/ena_profile_edit_screen/ena_profile_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: const Color(0xff22262B),
      elevation: 0,
      title: Column(
        children: [
          SizedBox(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
              textColor: Colors.white,
              iconColor: Colors.white,
              leading: Stack(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/ena_profile_screen');
                      },
                      child: ValueListenableBuilder(
                        valueListenable: EnprofileimgListener,
                        builder: (context, value, child) {
                          return CircleAvatar(
                            backgroundImage: value != null
                                ? FileImage(value)
                                : AssetImage('assets/persons/person3.jfif')
                                    as ImageProvider<Object>?,
                          );
                        },
                      )),
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 5,
                    ),
                  )
                ],
              ),
              title: Wrap(
                children: const [
                  Text(
                    'Samuel John',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  // CircleAvatar(
                  //   backgroundColor: Colors.amber,
                  //   radius: 12,
                  //   child: Icon(
                  //     Icons.expand_more,
                  //     size: 25,
                  //     color: Colors.black,
                  //   ),
                  // )
                ],
              ),
              subtitle: Wrap(
                children: const [
                  Icon(
                    Icons.location_on,
                    color: Color(0xffFEBA45),
                    size: 17,
                  ),
                  Text(
                    'Trivandrum,palayam',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ena_notification_screen');
                },
                icon: Stack(
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
                          child: Text('4'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottom: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        toolbarHeight: 180.h,
        backgroundColor: const Color(0xff22262B),
        title: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomProgresIndicator(
                  cardName: 'Active',
                  count: '01',
                  percentage: 0.1,
                ),
                CustomProgresIndicator(
                  cardName: 'Pending',
                  count: '02',
                  percentage: 0.8,
                ),
                CustomProgresIndicator(
                  cardName: 'Completed',
                  count: '10',
                  percentage: 0.4,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomWalletContainer(
                  cardName: 'Earned',
                  count: '6000',
                ),
                CustomWalletContainer(
                  cardName: 'Feedbacks',
                  count: '12',
                ),
              ],
            ),
          )
        ]),
      ),
      // expandedHeight: 300.h,
      // flexibleSpace: const FlexibleSpaceBar(title: Divider()),
    );
  }
}

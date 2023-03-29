import 'package:every_home/domain/dummy/db_function.dart';
import 'package:every_home/domain/dummy/models/dummy_bussines_model.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

class CustomProHomeAppBar extends StatelessWidget {
  const CustomProHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<DummyBussiness> business = DBFunction().fetchBusiness();
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: const Color(0xff22262B),
      elevation: 0,
      title: Column(
        children: [
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/pro_profile_screen',
                        arguments: business[1]);
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        //TODO Change Profile Picture
                        AssetImage(business[1].profilePic.toString()),
                  ),
                ),
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
                  'Hamdan L',
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
                Navigator.of(context).pushNamed('/pro_notification_screen');
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
                        child: Text('5'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottom: AppBar(
        backgroundColor: const Color(0xff22262B),
        toolbarHeight: 100.h,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.w),
          child: const CustomFormField(
            hintText: 'Search',
            prefixIcon: Icon(IconlyLight.search),
          ),
        ),
      ),

      expandedHeight: 130.h,
      // flexibleSpace: const FlexibleSpaceBar(title: Divider()),
    );
  }
}

import 'package:every_home/domain/dummy/db_function.dart';
import 'package:every_home/presentation/modules/customer/home_screen/widgets/custom_search_badge.dart';
import 'package:every_home/presentation/modules/customer/home_screen/widgets/custom_service_section.dart';
import 'package:every_home/presentation/modules/customer/home_screen/widgets/custom_work_schedule_tile.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

class CusHomeScreen extends StatelessWidget {
  const CusHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO customer dummy data
    final customers = DBFunction().fetchCustomer();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                            Navigator.of(context).pushNamed(
                                '/cus_profile_screen',
                                arguments: customers[1]);
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(customers[1].profilePic.toString()),
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
                        customers[1].name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    subtitle: Row(
                      // direction: Axis.horizontal,
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
                              customers[1].place.toString(),
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
                    child: Container(
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
                  ),
                ),
              ],
              bottom: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 0.75.sw,
                      child: const CustomFormField(
                          prefixIcon: Icon(
                            IconlyLight.search,
                            color: Colors.black,
                          ),
                          hintText: 'Search your Requirements'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 65.h,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/filter_icon.svg',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CustomSearchBadge(
                    viewAll: 'View all',
                    searchTitle: 'Select Category',
                    onPress: () {},
                  ),
                  const CustomServiceSection(),
                  const CustomSearchBadge(
                    searchTitle: 'Work Schedules',
                  ),
                  SizedBox(
                    height: 0.1.sh,
                    width: 1.sw,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CustomWorkScheduleTile(
                            workName: 'Ceiling Light Repainring',
                            postedDate: '08 Aug 2023',
                            postedTime: '8:20PM',
                            onTap: () {},
                          );
                        }),
                  ),
                  CustomSearchBadge(
                    searchTitle: 'Offers',
                    viewAll: 'View all',
                    onPress: () {
                      //TODO onTap of the offers section
                    },
                  ),
                  const CustomOffersContainer(
                    offerImage: 'assets/persons/offer1.png',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomOffersContainer extends StatelessWidget {
  const CustomOffersContainer({
    super.key,
    required this.offerImage,
  });
  final String offerImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.15.sh,
      width: 1.sw,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(offerImage),
            ),
          );
        },
      ),
    );
  }
}

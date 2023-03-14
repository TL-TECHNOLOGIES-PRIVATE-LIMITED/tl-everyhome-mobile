import 'package:every_home/domain/dummy/db_function.dart';
import 'package:every_home/presentation/modules/customer/cus_home_screen/widgets/custom_cus_home_appbar.dart';
import 'package:every_home/presentation/modules/customer/cus_home_screen/widgets/custom_offers_container.dart';
import 'package:every_home/presentation/modules/customer/cus_home_screen/widgets/custom_search_badge.dart';
import 'package:every_home/presentation/modules/customer/cus_home_screen/widgets/custom_service_section.dart';
import 'package:every_home/presentation/modules/customer/cus_home_screen/widgets/custom_work_schedule_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            CustomCusHomeAppBar(
              cusName: customers[1].name.toString(),
              cusLocation: customers[1].place.toString(),
              customer: customers[1],
              profilePicture: customers[1].profilePic.toString(),
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

import 'package:every_home/presentation/modules/enabler/ena_home_screen/widgets/custom_appbar.dart';
import 'package:every_home/presentation/modules/enabler/widgets/custom_ena_job_tile.dart';
import 'package:every_home/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class EnaHomeScreen extends StatelessWidget {
  const EnaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.w),
                  child: const CustomFormField(
                    hintText: 'Search',
                    prefixIcon: Icon(IconlyLight.search),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.w),
                  child: Text(
                    'Job List (10)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff232930),
                    ),
                  ),
                ),
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return const CustomEnaJobTile(
                        tileType: 'New',
                        jobName: 'Ceiling Fan Repairing',
                        jobPlace: 'Trivandrum,Playam',
                        workerName: 'Daniel Jo',
                        postedDate: '1d ago',
                        jobPrice: '800',
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

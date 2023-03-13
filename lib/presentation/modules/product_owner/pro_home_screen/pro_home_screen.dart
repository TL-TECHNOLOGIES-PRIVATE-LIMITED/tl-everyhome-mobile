import 'package:every_home/presentation/modules/product_owner/pro_home_screen/widgets/custom_pro_home_appbar.dart';
import 'package:every_home/presentation/modules/product_owner/widgets/custom_pro_job_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProHomeScreen extends StatelessWidget {
  const ProHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomProHomeAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 17.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Works in your area (10)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff232930),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushNamed('/ena_job_details_screen');
                      },
                      child: const CustomProJobTile(
                        tileType: 'New',
                        jobName: 'Ceiling Fan Repairing',
                        jobPlace: 'Trivandrum,Playam',
                        workerName: 'Daniel Jo',
                        postedDate: '1d ago',
                        jobPrice: '800',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

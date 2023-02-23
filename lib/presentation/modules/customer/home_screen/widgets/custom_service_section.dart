
import 'package:every_home/presentation/modules/customer/home_screen/widgets/custom_service_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServiceSection extends StatelessWidget {
  const CustomServiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 0.2.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomServicesTile(
                  serviceName: 'Painter',
                  icon: 'assets/icons/services/painter_icon.svg',
                ),
                CustomServicesTile(
                  serviceName: 'Electrician',
                  icon: 'assets/icons/services/electrician_icon.svg',
                ),
                CustomServicesTile(
                  serviceName: 'Plumber',
                  icon: 'assets/icons/services/plumbing_icon.svg',
                ),
                CustomServicesTile(
                  serviceName: 'Cleaner',
                  icon: 'assets/icons/services/cleaning_icon.svg',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomServicesTile(
                  serviceName: 'Moving',
                  icon: 'assets/icons/services/truck_icon.svg',
                ),
                CustomServicesTile(
                  serviceName: 'Taxi',
                  icon: 'assets/icons/services/taxi_icon.svg',
                ),
                CustomServicesTile(
                  serviceName: 'Fish',
                  icon: 'assets/icons/services/fish_icon.svg',
                ),
                CustomServicesTile(
                  serviceName: 'Events',
                  icon: 'assets/icons/services/party_icon.svg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

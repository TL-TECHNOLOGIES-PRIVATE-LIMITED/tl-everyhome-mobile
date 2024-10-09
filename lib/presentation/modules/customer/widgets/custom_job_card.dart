import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cus_main_screen/widgets/custom_bottom_navbar.dart';

class CustomJobCard extends StatefulWidget {
  const CustomJobCard({
    super.key,
    required this.image,
    required this.jobTitle,
    required this.jobLocation,
    required this.rating,
    required this.reviewCount,
    this.isFavourite,
  });

  final String image;
  final String jobTitle;
  final String jobLocation;
  final double rating;
  final String reviewCount;
  final bool? isFavourite;

  @override
  _CustomJobCardState createState() => _CustomJobCardState();
}

class _CustomJobCardState extends State<CustomJobCard> {
  ValueNotifier<bool> _isFavouriteNotifier =
      ValueNotifier(false); // Use ValueNotifier for favorite state
  bool? _isChecked = false; // Initial value of checkbox

  @override
  void initState() {
    super.initState();
    _isFavouriteNotifier = ValueNotifier<bool>(widget.isFavourite ??
        false); // Initialize ValueNotifier with the current favorite state
  }

  @override
  void dispose() {
    _isFavouriteNotifier
        .dispose(); // Dispose of the notifier when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 20,
        child: Container(
          width: 390.w,
          height: 110.h,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff898989)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 80.h,
                    width: 80.h,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          widget.jobTitle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Wrap(
                          spacing: 3,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.jobLocation,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Wrap(
                          spacing: 5,
                          children: [
                            RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: widget.rating,
                              allowHalfRating: true,
                              itemSize: 16,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              },
                              onRatingUpdate: (value) {},
                            ),
                            Text(
                              '${widget.rating} (${widget.reviewCount} Reviews)',
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Use ValueListenableBuilder to update the favorite button dynamically
                    ValueListenableBuilder<bool>(
                      valueListenable: _isFavouriteNotifier,
                      builder: (context, isFavourite, child) {
                        return GestureDetector(
                          onTap: () {
                            _isFavouriteNotifier.value =
                                !isFavourite; // Toggle favorite state
                          },
                          child: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.amber,
                            size: 25.h,
                          ),
                        );
                      },
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Color(0xffC7C7C7),
                    ),
                    ValueListenableBuilder(
                      valueListenable: cusBottomNavIndexNotifier,
                      builder: (context, value, child) {
                        return value == 3
                            ? SizedBox()
                            : SizedBox(
                                height: 15,
                                width: 15,
                                child: Checkbox(
                                  activeColor: Colors.amber,
                                  checkColor: Colors.black,
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors.amber; // Checked color
                                      }
                                      return Colors
                                          .transparent; // Unchecked color
                                    },
                                  ),
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  },
                                ),
                              );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/recent_destination_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressOptions extends StatelessWidget {
  const AddressOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.bookmark_border,
              weight: 1.5,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Saved Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.star_border,
              weight: 1.5,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Favorite Address',
                style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            showMyBottomSheet(
                context,
                "Select Recent Destinations",
                const [
                  RecentDestination(
                      name: "Giga mall plaza",
                      address: "8946 Essex St. Sunnyside, In46321",
                      isSaved: true,
                      isFavorite: true),
                  RecentDestination(
                      name: "Mega Mall Plaza",
                      address: "8946 Essex St. Sunnyside, In46321",
                      isSaved: false,
                      isFavorite: false),
                  RecentDestination(
                      name: "Mini Park",
                      address: "8946 Essex St. Sunnyside, In46321",
                      isSaved: false,
                      isFavorite: false),
                ],
                () {});
          },
          child: Row(
            children: [
              Icon(
                Icons.history,
                weight: 1.5,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text('Recent Destinations',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ],
    );
  }
}

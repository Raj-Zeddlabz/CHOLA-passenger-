import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentDestination {
  final String name;
  final String address;
  final bool isFavorite;
  final bool isSaved;

  const RecentDestination({
    required this.name,
    required this.address,
    required this.isFavorite,
    required this.isSaved,
  });
}

class RecentDestinationItem extends StatelessWidget {
  final RecentDestination destination;

  const RecentDestinationItem({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Color(0xFFC6BFFF),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
        child: Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              size: 30.sp,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.0.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    destination.address,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(
                  destination.isFavorite ? Icons.star : Icons.star_border,
                  color: Colors.black,
                ),
                Icon(
                  destination.isFavorite
                      ? Icons.archive_outlined
                      : Icons.archive_rounded,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  final String title;
  final List<RecentDestination> destinations;
  final VoidCallback onPressed; // Callback for the button

  const MyBottomSheet({
    super.key,
    required this.title,
    required this.destinations,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.sp),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Color(0xFFD9D4FF),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Wrap content height
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) => RecentDestinationItem(
                destination: destinations[index],
              ),
            ),
          ),
          AgreeButton(
            buttonText: "Okay",
            onPressed: () {},
            width: 0.62.w,
            borderRadius: 15.r,
          )
        ],
      ),
    );
  }
}

void showMyBottomSheet(BuildContext context, String title,
    List<RecentDestination> destinations, VoidCallback onPressed) {
  showModalBottomSheet(
    enableDrag: true,
    context: context,
    builder: (context) => MyBottomSheet(
        title: title, destinations: destinations, onPressed: onPressed),
  );
}

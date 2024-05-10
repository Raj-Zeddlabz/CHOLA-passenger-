import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverDetailsWidget extends StatelessWidget {
  final String carName;
  final String seats;
  final String licenseNo;
  final String driverName;
  const DriverDetailsWidget({
    super.key,
    required this.carName,
    required this.seats,
    required this.licenseNo,
    required this.driverName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carName,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(seats)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50.h,
              width: 120.w,
              child: Image.asset(
                "assets/car3.png",
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/person.png"),
                Text(
                  driverName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 60.h,
              child: VerticalDivider(
                color: Colors.grey,
              ),
            ),
            Column(
              children: [
                Text(
                  "License Plate",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 30.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      color: Color(0xFFFAEBB3),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Center(
                    child: Text(
                      licenseNo,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

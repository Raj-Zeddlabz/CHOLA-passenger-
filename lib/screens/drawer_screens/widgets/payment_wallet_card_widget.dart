import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCardWidget extends StatelessWidget {
  final IconData icon;
  const WalletCardWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 130.h,
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(200, 86, 90, 198),
            Color.fromARGB(180, 152, 72, 180),
            Color.fromARGB(100, 162, 69, 206),
            Color.fromARGB(30, 142, 150, 153),
            Color(0x0ABE24D7),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chola Cash",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "INR 0.00",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Icon(
                icon,
                size: 30.sp,
                weight: 20,
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 100.w,
                height: 35.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.black),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      "Gift Card",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                width: 100.w,
                height: 35.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.green),
                child: Center(
                  child: Text(
                    "Active",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCardWidget extends StatelessWidget {
  final String image;
  final String title;
  const PaymentCardWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
              color: Colors.grey.shade600)
        ],
        color: Color(0xffBAC1FF),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 60.h, width: 60.h, child: Image.asset(image)),
          SizedBox(
            width: 20.w,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
          ),
          Spacer(),
          Icon(
            Icons.play_arrow,
            size: 25.sp,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherPreferencesWidget extends StatefulWidget {
  const OtherPreferencesWidget({super.key});

  static bool disabilitySwitch = false;
  static bool childrenSwitch = false;
  static bool petFriendlySwitch = false;

  @override
  State<OtherPreferencesWidget> createState() => _OtherPreferencesWidgetState();
}

class _OtherPreferencesWidgetState extends State<OtherPreferencesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Color(0xffCFD6FF),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Disablity Assistance",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
              Switch(
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    // light = value;
                    OtherPreferencesWidget.disabilitySwitch = value;
                  });
                },
                value: OtherPreferencesWidget.disabilitySwitch,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Children",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
              Switch(
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    // light = value;
                    OtherPreferencesWidget.childrenSwitch = value;
                  });
                },
                value: OtherPreferencesWidget.childrenSwitch,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pets Friendly",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
              Switch(
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    // light = value;
                    OtherPreferencesWidget.petFriendlySwitch = value;
                  });
                },
                value: OtherPreferencesWidget.petFriendlySwitch,
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferedCarWidget extends StatefulWidget {
  const PreferedCarWidget({super.key});

  static int selectedCarIndex = -1;
  @override
  State<PreferedCarWidget> createState() => _PreferedCarWidgetState();
}

class _PreferedCarWidgetState extends State<PreferedCarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  PreferedCarWidget.selectedCarIndex = index;
                });
              },
              child: Container(
                height: 80.h,
                width: 80.h,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      PreferedCarWidget.selectedCarIndex != index
                          ? const Color(0xDD785BF4)
                          : Colors.white,
                      PreferedCarWidget.selectedCarIndex != index
                          ? Color(0x00FFB61D)
                          : Colors.white
                    ],
                  ),
                ),
                child: index % 2 == 0
                    ? Image.asset('assets/yellow_car.png')
                    : Image.asset('assets/car.png'),
              ),
            );
          }),
    );
  }
}

import 'package:chola_passanger_ui/screens/home_screens/bottom_nav_bar.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFFE6D4FF),
              Color(0xFFF1D3FF),
            ])),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 200.w,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset("assets/success.png")),
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset("assets/yes.png")),
                      ],
                    ),
                  ),
                  Text(
                    "INR 1000.00 Added to\nCHOLA wallet",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Confirmation #: 123456 ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 100.w,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: AgreeButton(
                    buttonText: "Continue",
                    onPressed: () {
                      Get.to(BottomNavBarScreen(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 350));
                    },
                    width: 0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}

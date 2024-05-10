import 'package:chola_passanger_ui/screens/home_screens/bottom_nav_bar.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/payment_card_widget.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:chola_passanger_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: 80.h,
          title: 'Make Payment',
          onPressed: () {
            Get.offAll(BottomNavBarScreen(),
                transition: Transition.zoom,
                duration: Duration(milliseconds: 350));
          },
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE2D4FF), Color(0xffF2D3FF)],
            ),
          ),
          child: Column(
            children: [
              Text(
                "Complete your payment of\nINR 250.00",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return dialog(context);
                      },
                    );
                  },
                  child: PaymentCardWidget(
                      image: "assets/CHOLA.png", title: "Chola Pay")),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return dialog(context);
                    },
                  );
                },
                child: PaymentCardWidget(
                    image: "assets/mastercard.png", title: "Master Card"),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return dialog(context);
                    },
                  );
                },
                child: PaymentCardWidget(
                    image: "assets/GooglePay.png", title: "Google Pay"),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return dialog(context);
                    },
                  );
                },
                child: PaymentCardWidget(
                    image: "assets/Discount.png", title: "Discount"),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return dialog(context);
                      },
                    );
                  },
                  child: PaymentCardWidget(
                      image: "assets/visa.png", title: "Visa")),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "App Payment Method",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Icon(
                    Icons.add_circle_rounded,
                    size: 25.sp,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              AgreeButton(
                  buttonText: "Pay",
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return dialog(context);
                      },
                    );
                  },
                  width: 0.8),
              // StatusEcliseWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget dialog(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actions: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Get.offAll(BottomNavBarScreen(),
                transition: Transition.zoom,
                duration: Duration(milliseconds: 350));
          },
          child: Center(
            child: Container(
              width: double.maxFinite,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Color(0xff4320DB),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: Text(
                  "Okay",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
      content: Text(
        'To Get Payments From Passenger We need APIs to reflect the amount to Chola And choose the driver’s bank account ',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

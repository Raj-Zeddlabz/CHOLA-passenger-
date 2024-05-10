import 'package:chola_passanger_ui/screens/drawer_screens/payment_screens/success_screen.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/payment_card_widget.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:chola_passanger_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddMoneyToWallet extends StatelessWidget {
  const AddMoneyToWallet({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 300), () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.topCenter,
            actions: [
              Center(
                child: AgreeButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Okay',
                  width: .5,
                ),
              )
            ],
            content: Text(
              'Please choose one of the given payment\nmethod and click on add button',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      );
    });
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: 80.h,
          title: 'Add Money',
          onPressed: () {
            Get.back();
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
                "Adding INR 1000.00 to\nCHOLA wallet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                  buttonText: "Add",
                  onPressed: () {
                    Get.to(SuccessScreen(),
                        transition: Transition.zoom,
                        duration: Duration(milliseconds: 350));
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

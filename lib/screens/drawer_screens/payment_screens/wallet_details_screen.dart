import 'package:chola_passanger_ui/screens/drawer_screens/payment_screens/add_money_to_wallet.dart';
import 'package:chola_passanger_ui/screens/drawer_screens/widgets/payment_wallet_card_widget.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:chola_passanger_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WalletDetailsScreen extends StatelessWidget {
  const WalletDetailsScreen({super.key});
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
              'Please enter the amount and\nclick on add money button',
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
          title: 'Chola Wallet',
          onPressed: () {
            Navigator.of(context).pop();
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
              WalletCardWidget(
                icon: Icons.arrow_back,
              ),
              SizedBox(
                height: 20.h,
              ),

              Text(
                "Add Money to Wallet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 5,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      hintText: "1000.00"),
                ),
              ),

              AgreeButton(
                  buttonText: "Proceed to add",
                  onPressed: () {
                    Get.to(AddMoneyToWallet(),
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

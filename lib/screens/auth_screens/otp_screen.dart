import 'dart:async';

import 'package:chola_passanger_ui/constants/snackbar.dart';
import 'package:chola_passanger_ui/screens/home_screens/bottom_nav_bar.dart';
import 'package:chola_passanger_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/agree_button_widget.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _resendSeconds = 30;
  Timer? _resendTimer;

  TextEditingController _otpController = TextEditingController();

  bool _showResendButton = false;

  final _emailFormKey = GlobalKey<FormState>();

  bool alert = true;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer!.cancel();
    super.dispose();
  }

  void startResendTimer() {
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendSeconds > 0) {
        setState(() {
          _resendSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _showResendButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (alert)
      Future.delayed(Duration(seconds: 1), () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
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
                  'Please enter OTP as\n123456',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            });
      });
    alert = false;
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final defaultPinTheme = PinTheme(
      width: size.width * 0.2,
      height: size.height * 0.07,
      textStyle: TextStyle(
          fontSize: size.shortestSide * 0.06,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Color(0xFF839DFE),
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xFFBAC1FF),
      ),
    );
    return Padding(
      padding: EdgeInsets.only(
        top: statusBarHeight,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Phone OTP",
          preferredHeight: MediaQuery.of(context).size.height * 0.075,
        ),
        body: SingleChildScrollView(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE1D5FF), Color(0xFFFAD2FF)],
              ),
            ),
            child: SizedBox(
              height: size.height - statusBarHeight,
              child: Form(
                key: _emailFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Enter the 6-digit code sent to \n9876543210",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        length: 6,
                        autofocus: true,
                        isCursorAnimationEnabled: true,
                        controller: _otpController,
                        onCompleted: (value) async {},
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    AgreeButton(
                      buttonText: "Confirm",
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 2));
                        String otp = _otpController.text.toString();
                        if (otp.length < 6) {
                          CustomSnackbar.showError(
                              "Incomplete field!", "Enter 6 digit otp");
                        } else if (otp == "123456") {
                          CustomSnackbar.showSuccess(
                              "Success!", "Phone number verified!");
                          Get.offAll(BottomNavBarScreen(),
                              transition: Transition.fadeIn,
                              duration: Duration(milliseconds: 350));
                        } else {
                          CustomSnackbar.showError("Incorrect OTP!",
                              "Phone number verification failed!");
                        }
                      },
                      width: 0.7,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    _showResendButton
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _resendSeconds = 30;
                                    startResendTimer();
                                  });
                                },
                                child: Text(
                                  "Resend OTP",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.shortestSide * 0.04,
                                    color: const Color(0xFF000000),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                // padding: 0.6,
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: Text(
                                "Resend OTP $_resendSeconds sec(s)",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.shortestSide * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/screens/auth_screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/agree_button_widget.dart';
import '../../widgets/field_widet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode _phoneNumberFocusNode = FocusNode();
  String dialCode = '+91';
  Map<String, dynamic> data = {};
  bool isLoading = false;
  bool alert = true;

  @override
  void initState() {
    super.initState();
    _phoneNumberFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    if (alert) {
      Future.delayed(Duration(seconds: 1), () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                alignment: Alignment.bottomCenter,
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
                  'Please enter the given number as 9876543210 and click on the next button to proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            });
      });
    }
    alert = false;
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Scaffold(
        // backgroundColor: Constants.themeColor,
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFBD1FF), Color(0xFFE1D5FF)],
            ),
          ),
          child: SizedBox(
            height: size.height - statusBarHeight,
            child: Stack(
              children: [
                if (isLoading)
                  const Align(
                    alignment: Alignment.topCenter,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: Color(0xff6A4DE8),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Enter Your Phone Number',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.shortestSide * 0.0533,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              // width: size.width * 0.2,
                              child: CountryCodePicker(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.001,
                                  bottom: size.height * 0.001,
                                  left: size.height * 0.00,
                                  right: size.height * 0.00,
                                ),

                                onChanged: (value) {
                                  // countryCode = CountryCode(dialCode: value.dialCode);
                                  setState(() {
                                    dialCode = value.dialCode!;
                                  });
                                },
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IN',
                                favorite: ['+91', 'IN'],
                                // optional. Shows only country name and flag when popup is closed.
                                showCountryOnly: false,

                                // optional. Shows the dialog
                                showOnlyCountryWhenClosed: true,
                                showDropDownButton: true,
                                // dialogBackgroundColor: Constants.themeColor,
                                // barrierColor: Colors.amberAccent,
                                // flagDecoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(4),
                                // ),
                                searchDecoration: InputDecoration(
                                  hintText: "Search",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // flagWidth: size.width * 0.1,

                                hideMainText: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                                // optional. shows the flag instead
                                showFlag: true,
                                // showFlagMain: true,
                                // optional. shows the flag in the Text
                                showFlagDialog: true,
                                // optional. closes the dialog when an item is picked
                                closeIcon: Icon(
                                  Icons.close,
                                  color: Theme.of(
                                    context,
                                  ).primaryColor,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: size.width * 0.02,
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Field(
                          labelText: "",
                          hintText: "Phone Number",
                          vertical: 0.03,
                          horizontal: 0.04,
                          fieldController: phoneNumberController,
                          focusNode: _phoneNumberFocusNode,
                          maxLength: 10,
                          prefixWidget: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 10.w),
                              child: Text("$dialCode: ")),
                          keyboardType: TextInputType.number,
                          snackbarText: '* Required',
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AgreeButton(
                          buttonText: "Next",
                          onPressed: () async {
                            if (phoneNumberController.text.isEmpty) {
                              Constants.showError(
                                  context, 'Phone Number is required');
                            } else if (phoneNumberController.text.length <= 9) {
                              Constants.showError(
                                  context, 'Enter a Valid Phone Number');
                            } else if (phoneNumberController.text.trim() ==
                                "9876543210") {
                              setState(() {
                                isLoading = true;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 2000));
                              setState(() {
                                isLoading = false;
                              });
                              Get.to(OtpScreen(),
                                  transition: Transition.fadeIn,
                                  duration: Duration(milliseconds: 350));
                            }
                          },
                          width: 1,
                          borderRadius: 12,
                          suffixWidget: const Icon(
                            Icons.double_arrow,
                            color: Colors.white,
                          ),
                          fontSize: size.shortestSide * 0.05333,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'By continuing you may receive an SMS for verification.\nStandard Message and data rates may apply.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: size.shortestSide * 0.05,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Divider(
                                color: Color(0xff757575),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'or',
                                style: TextStyle(
                                  color: Color(0xff757575),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Divider(
                                color: Color(0xff757575),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        AgreeButton(
                          buttonText: "Continue With Facebook",
                          fontSize: size.shortestSide * 0.03733,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PartnerPreForm(),
                            //   ),
                            // );
                            Constants.showError(context,
                                "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                          },
                          width: 0.9,
                          fillColor: [Colors.white, Colors.white],
                          textColor: Colors.black,
                          borderRadius: 0,
                          prefixWidget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/fb_.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AgreeButton(
                          buttonText: "Continue With Google",
                          fontSize: size.shortestSide * 0.03733,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ComingSoon(),
                            //   ),
                            // );
                            Constants.showError(context,
                                "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                          },
                          width: 0.9,
                          fillColor: [Colors.white, Colors.white],
                          textColor: Colors.black,
                          borderRadius: 0,
                          prefixWidget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/google_.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

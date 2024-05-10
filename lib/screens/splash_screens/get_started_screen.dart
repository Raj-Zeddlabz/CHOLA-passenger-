import 'package:chola_passanger_ui/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/agree_button_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFDFD5FF), Color(0xFFFBD1FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: size.height * 0.1,
          top: size.height * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Chola_Logo.png',
                  width: size.width,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  '     Drive with CHOLA \n              Own a Chariot',
                  // textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.shortestSide * 0.05867,
                    fontFamily: 'Radley',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 1.43,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            AgreeButton(
              buttonText: "Get Started",
              borderRadius: 12,
              onPressed: () {
                Get.to(LoginScreen(),
                    transition: Transition.circularReveal,
                    duration: Duration(milliseconds: 350));
              },
              suffixWidget: Icon(
                Icons.double_arrow,
                color: Colors.white,
              ),
              width: 0.7,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.0533,
            ),
          ],
        ),
      ),
    ));
  }
}

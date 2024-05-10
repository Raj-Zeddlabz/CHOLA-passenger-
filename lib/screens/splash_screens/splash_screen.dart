import 'package:chola_passanger_ui/screens/splash_screens/get_started_screen.dart';
import 'package:chola_passanger_ui/widgets/landscape_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(GetStartedScreen(),
          transition: Transition.fadeIn, duration: Duration(milliseconds: 350));
    });
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return LandscapeIcon();
          } else {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Splashscreen.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Chola_Logo.png',
                    width: size.width,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    '     Travel made Easy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.shortestSide * 0.05867,
                      fontFamily: 'RacingSansOne',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 1.43,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:chola_passanger_ui/screens/account_screens/account_screen.dart';
import 'package:chola_passanger_ui/screens/home_screens/home_screen.dart';
import 'package:chola_passanger_ui/screens/service_screens/service_screen.dart';
import 'package:chola_passanger_ui/screens/ventures_screens/venture_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({
    super.key,
  });

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  List<Widget> _buildScreens = [
    HomeScreen(),
    ServiceScreen(),
    VentureScreen(),
    AccountScreen()
  ];

  bool alert = true;

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
                  'Please click on the ride now button',
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
    return SafeArea(
      child: Scaffold(
        body: PageView(
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: _buildScreens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: MediaQuery.of(context).size.width * 0.08,
          fixedColor: Color(0xff000000),
          unselectedItemColor: Color(0xff454545),
          currentIndex: currentIndex,
          backgroundColor: Color(0xFFCFD6FF),
          elevation: MediaQuery.of(context).size.width * 0.7,
          useLegacyColorScheme: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps_sharp),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_history),
              label: 'Ventures',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          onTap: (value) {
            setState(() {
              currentIndex = value;
              pageController.jumpToPage(value);
            });
          },
        ),
      ),
    );
  }
}

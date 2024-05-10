import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/screens/auth_screens/login_screen.dart';
import 'package:chola_passanger_ui/screens/drawer_screens/payment_screens/payment_screen.dart';
import 'package:chola_passanger_ui/screens/home_screens/bottom_nav_bar.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:chola_passanger_ui/widgets/custom_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({super.key});

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
              'Click On Payment Option in the Menu To See\nThe Payments Options',
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
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Drawer(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC8C5EE), Color(0xFFFECFFF)],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3F20FE), Color(0xFCD81CAE)],
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double titleFontSize = constraints.maxWidth * 0.15;
                      double subtitleFontSize = constraints.maxWidth * 0.05;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'CHOLA',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: titleFontSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                      height: 1,
                                      letterSpacing: 5,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Chariots',
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: subtitleFontSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: constraints.maxWidth * 0.2,
                          // ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                // Get.back();
                                Get.offAll(BottomNavBarScreen());
                              },
                              child: Container(
                                child: Image.asset('assets/close.png'),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    CustomListTile1(
                      icon: Icons.person_outline_sharp,
                      title: 'Account',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AccountPage(),
                        //   ),
                        // );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.person,
                      title: 'Profile',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AccountPage(),
                        //   ),
                        // );
                        Constants.showError(context,
                            "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.bookmark_outline,
                      title: 'Address',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FavouriteAddress(),
                        //   ),
                        // );
                      },
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    CustomListTile1(
                      icon: Icons.credit_card_outlined,
                      title: 'Payments',
                      onTap: () {
                        Get.to(PaymentScreen(),
                            transition: Transition.leftToRight,
                            duration: Duration(milliseconds: 350));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.card_giftcard_sharp,
                      title: 'Refer & Earn',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ReferAndEarn(),
                        //   ),
                        // );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.add_card_rounded,
                      title: 'Gift Cards',
                      onTap: () {
                        Constants.showError(context,
                            "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Setting(),
                        //   ),
                        // );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.hourglass_top_outlined,
                      title: 'Venture',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HistoryPage(),
                        //   ),
                        // );
                      },
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    CustomListTile1(
                      icon: Icons.description_outlined,
                      title: 'Terms & Privacy Policy',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => TermsRideSchedule(),
                        //   ),
                        // );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.headset_mic_outlined,
                      title: 'Support',
                      onTap: () {
                        Constants.showError(context,
                            "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.help_outline_outlined,
                      title: 'Help',
                      onTap: () {
                        Constants.showError(context,
                            "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomListTile1(
                      icon: Icons.play_circle_outline,
                      title: 'Demo',
                      onTap: () {
                        Constants.showError(context,
                            "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.13,
                  right: MediaQuery.of(context).size.width * 0.13,
                  bottom: MediaQuery.of(context).size.width * 0.07,
                ),
                child: AgreeButton(
                  buttonText: "Logout",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Do you really want to Logout?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide *
                                      0.05,
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: AgreeButton(
                                    buttonText: "No",
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .shortestSide *
                                        0.06,
                                    width: 0.3,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Flexible(
                                  child: AgreeButton(
                                    buttonText: "Yes",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    fillColor: [
                                      Colors.black,
                                      Colors.black,
                                    ],
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .shortestSide *
                                        0.06,
                                    width: 0.4,
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyHomePage()),
                    // );
                  },
                  width: 0.6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/widgets/custom_app_bar.dart';
import 'package:chola_passanger_ui/widgets/landscape_icon_widget.dart';
import 'package:chola_passanger_ui/widgets/service_button.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Scaffold(
            appBar: CustomAppBar(
              preferredHeight: MediaQuery.of(context).size.height * 0.075,
              title: 'Services',
              onPressed: () {
                ;
              },
            ),
            // PreferredSize(
            //   preferredSize: Size.fromHeight(
            //     MediaQuery.of(context).size.height * 0.08,
            //   ),
            //   child: AppBar(
            //     backgroundColor: Color(0xFFBAC1FF),
            //     centerTitle: true,
            //     title: Text(
            //       'Services',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
            //         fontFamily: 'Poppins',
            //         fontWeight: FontWeight.w600,
            //         height: 0,
            //       ),
            //     ),
            //     leading: ElevatedButton(
            //       child: Icon(
            //         Icons.arrow_back_ios_new,
            //         color: Colors.white,
            //       ),
            //       onPressed: () {
            // setState(() {
            //   _currentIndex = 0;
            // });
            // Navigator.push(context,
            //     MaterialPageRoute(builder: ((context) => HomePage())));
            //       },
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.black,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(30),
            //             bottomRight: Radius.circular(30),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: Constants.gradientColor,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ChooseLocation()),
                                // );
                                //Naviagte to destination Page
                              },
                              child_widget: Image.asset(
                                'assets/Trip.png',
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              // icon: Icons.credit_card,
                              text: "Trip"),
                          ServiceButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => IntercityRide()),
                                // );
                                //Naviagte to destination Page
                              },
                              child_widget: Image.asset(
                                'assets/service_intercity.png',
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              // icon: Icons.translate_sharp,
                              text: "Intercity"),
                          ServiceButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => RideRental()),
                                // );
                                //Naviagte to destination Page
                              },
                              child_widget: Image.asset(
                                'assets/Trip.png',
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              // icon: Icons.person,
                              text: "Rental"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => RideSchedule()),
                                // );
                                //Naviagte to destination Page
                              },
                              child_widget: Image.asset(
                                'assets/service_reserve.png',
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              // icon: Icons.chat_bubble_outline_rounded,
                              text: "Reserve"),
                          ServiceButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => GroupRide()),
                                // );
                                //Naviagte to destination Page
                              },
                              child_widget: Image.asset(
                                'assets/service_group.png',
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              // icon: Icons.card_giftcard,
                              text: "Group"),
                          ServiceButton(
                              onPressed: () {
                                Constants.showError(context,
                                    "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                                //Naviagte to destination Page
                              },
                              child_widget: Image.asset(
                                'assets/service_package.png',
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 6,
                              ),
                              // icon: Icons.feedback_outlined,
                              text: "Package"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ServiceButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ChooseLocation()),
                              // );
                              Constants.showError(context,
                                  "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                              //Naviagte to destination Page
                            },
                            child_widget: Image.asset(
                              'assets/service_metro2.png',
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.width / 6,
                            ),
                            // icon: Icons.chat_bubble_outline_rounded,
                            text: "Metro",
                          ),
                        ],
                      ),
                    ])),
          ),
        );
      }
    }));
  }
}

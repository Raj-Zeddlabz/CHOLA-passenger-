import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/choose_location_screen.dart';
import 'package:chola_passanger_ui/widgets/card_row_1.dart';
import 'package:chola_passanger_ui/widgets/card_row_2.dart';
import 'package:chola_passanger_ui/widgets/custom_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:get/get.dart';

import '../../widgets/ad_card_widget.dart';
import '../../widgets/custom_map_card.dart';
import '../../widgets/menu_drawer_widget.dart';
import '../../widgets/service_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController wheretoController = TextEditingController();

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.075,
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: AppBar(
              primary: false,
              backgroundColor: Color(0xFFBAC1FF),
              centerTitle: true,
              leading: CustomMenuIconButton(
                child_widget: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: size.width * 0.08,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/logo_home.png',
                  height: 70.h,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Constants.showError(context,
                          "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                      print('Notification Button Pressed');
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.amber,
                        )))
              ],
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ),
        ),
        drawer: MenuDrawerWidget(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFBD0FF),
                Color(0xFFFBD0FF),
                Color(0xDBD8D4FF),
                Color(0xDBD8D4FF),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
              top: MediaQuery.of(context).size.height * 0.01,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ChooseLocation(),
                      //   ),
                      // );
                      // //Naviagte to destination Page
                      // print('Tapped Button Where to?');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: wheretoController,
                        obscureText: false,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: "Where to?",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            color: Colors.black,
                          ),
                          hintText: "",
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          prefixIcon: Transform.rotate(
                            angle: 45 * (3.141592653589793 / 180),
                            child: Icon(Icons.navigation_rounded),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.shortestSide * 0.03,
                            horizontal:
                                MediaQuery.of(context).size.shortestSide * 0.04,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.black26,
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => RideSchedule(),
                              //   ),
                              // );
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Ink(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0, 3),
                                  )
                                ],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF2824dd),
                                    Color(0xFFc50fe2),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.06,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.001,
                                  vertical: size.height * 0.0001,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.access_time_filled,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      child: Center(
                                        child: Text(
                                          "Future Ride",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: size.shortestSide * 0.042,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
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
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Flexible(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.black26,
                            onTap: () {
                              Get.to(ChooseLocationPage(),
                                  transition: Transition.fadeIn,
                                  duration: Duration(milliseconds: 350));
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Ink(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0, 3),
                                  )
                                ],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF2824dd),
                                    Color(0xFFc50fe2),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.06,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.001,
                                  vertical: size.height * 0.0001,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.access_time_filled,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      child: Center(
                                        child: Text(
                                          "Ride Now",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: size.shortestSide * 0.042,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
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
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose Options ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.shortestSide * 0.07,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  DottedDashedLine(
                      height: 0, width: double.infinity, axis: Axis.horizontal),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ServiceButton(
                            onPressed: () {},
                            vertical: 0.01,
                            horizontal: 0.01,
                            fontsize: 0.04,
                            child_widget: Image.asset('assets/auto.png'),
                            text: 'Auto'),
                        ServiceButton(
                            onPressed: () {},
                            vertical: 0.02,
                            horizontal: 0.02,
                            fontsize: 0.04,
                            child_widget: Image.asset('assets/car.png'),
                            text: 'Mini'),
                        ServiceButton(
                            onPressed: () {},
                            vertical: 0.02,
                            horizontal: 0.02,
                            fontsize: 0.04,
                            child_widget: Image.asset('assets/car.png'),
                            text: 'Sedan'),
                        ServiceButton(
                            onPressed: () {},
                            vertical: 0.02,
                            horizontal: 0.02,
                            fontsize: 0.04,
                            child_widget: Image.asset('assets/car.png'),
                            text: 'Premium'),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  DottedDashedLine(
                    height: 0,
                    width: double.infinity,
                    axis: Axis.horizontal,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Go out with us ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.shortestSide * 0.05,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  CardRow(
                    colors: [
                      Color(0xff7a3e26),
                      Color(0xffCC00C0),
                      Color(0xff027302),
                      Color(0xff720455),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Plan your trip the way you like ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.shortestSide * 0.05,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  // Expanded(
                  // child:
                  CardRow1(
                    colors: [
                      Color(0xffB1243E),
                      Color(0xff0CA6C8),
                      Color(0xff9900CC),
                      Color(0xffCC0C0C),
                      Color(0xffCD7D05),
                      Color(0xff1B4242),
                    ],
                  ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  CustomMapCard(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  AdCardWidget(
                    ads: Constants.ads,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

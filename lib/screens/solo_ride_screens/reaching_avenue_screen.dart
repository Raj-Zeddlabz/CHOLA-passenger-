import 'dart:async';
import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/controllers/getx_controllers.dart/solo_ride_controller.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/make_payment_screen.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/driver_details_widget.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReachingAvenueScreen extends StatefulWidget {
  const ReachingAvenueScreen({super.key});

  @override
  State<ReachingAvenueScreen> createState() => _CustomBookingScreenState();
}

class _CustomBookingScreenState extends State<ReachingAvenueScreen> {
  // created controller to display Google Maps
  Completer<GoogleMapController> _controller = Completer();

  final controller = Get.find<SoloRideController>();

  List<LatLng> polyLineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.apiKey,
        PointLatLng(controller.pickUpLocation!.latitude,
            controller.pickUpLocation!.longitude),
        PointLatLng(controller.destinationLocation!.latitude,
            controller.destinationLocation!.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    final model = controller.driverInfo[0];
    Future.delayed(Duration(seconds: 5), () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              actions: [
                Center(
                  child: AgreeButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.to(MakePaymentScreen(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 350));
                    },
                    buttonText: 'Make payment',
                    width: .5,
                  ),
                )
              ],
              content: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "We are reaching your \ndestination in\n",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: "10 Min",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ])));
        },
      );
    });
    final CameraPosition _kGoogle = CameraPosition(
      target: controller.pickUpLocation!,
      // target: LatLng(16.78377, 74.55479),
      zoom: 14,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              //given camera position
              mapToolbarEnabled: true,
              initialCameraPosition: _kGoogle,
              mapType: MapType.terrain,
              // specified set of markers below
              markers: {
                Marker(
                    markerId: MarkerId("Source"),
                    position: controller.pickUpLocation!
                    // position: LatLng(16.78377, 74.55479),
                    ),
                Marker(
                    markerId: MarkerId("Destination"),
                    position: controller.destinationLocation!
                    // position: LatLng(16.77115, 74.55116)
                    ),
              },
              // on below line we have enabled location
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              // on below line we have enabled compass location
              compassEnabled: true,
              // on below line we have added polylines
              polylines: {
                Polyline(
                    polylineId: PolylineId("route"),
                    color: Colors.grey.shade500,
                    width: 4,
                    points: polyLineCoordinates),
              },
              // displayed google map
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                height: 500.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFBD1FF), Color(0xffD9D4FF)]),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                // color: Colors.red,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 200.w,
                              height: 75.h,
                              padding: EdgeInsets.all(4.sp),
                              decoration: BoxDecoration(
                                  color: Color(0xffFDE9EA),
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Text(
                                "Reaching avenue mall",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.sp),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            AgreeButton(
                              buttonText: "10:00 Min",
                              fontSize: 15.sp,
                              onPressed: () {},
                              width: 0.3,
                              prefixWidget: Icon(
                                Icons.timer_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 170.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.5,
                                        spreadRadius: 0.5,
                                        offset: Offset(0, 2),
                                        color: Colors.grey.shade500)
                                  ],
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Color(0xffCCD8FA)),
                              child: Center(
                                child: Text(
                                  "Ride # CR-0125",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Card(
                          color: Color(0xFFEBD3FF),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Est. Total Fare",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "INR ${model.finalFare}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "Additonal charges\nmay apply",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 6.sp),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50.w,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            const Color(0x742A26E1),
                                            Color(0x00BA14C8)
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "CHOLA\nPay",
                                          style: TextStyle(
                                              color: const Color(0xDD785BF4),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Text(
                                      "CHOLA Cash",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Drop-off Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_rounded),
                                      SizedBox(
                                        width: 300.w,
                                        child: Text(
                                          controller.destinationAddress.value !=
                                                  ""
                                              ? controller
                                                  .destinationAddress.value
                                              : "Vellore, TN",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),

                        // Driver Info
                        DriverDetailsWidget(
                          carName: model.carName,
                          driverName: model.driverName,
                          licenseNo: model.lisenceNo,
                          seats: model.seats,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trip Charges",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("INR 25"),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        // Tip Section
                        Card(
                          color: Color(0xFFBAC1FF),
                          child: Padding(
                            padding: EdgeInsets.all(16.0.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tip your Driver",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "The tips will go to driver",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 20.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text("0%"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.black,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text(
                                              "10%",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text("20%"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text("custom"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50.w,
                                  height: 50.h,
                                  child: Image.asset("assets/Donate.png"),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: MediaQuery.of(context).size.width * 0.08,
        fixedColor: Color(0xff000000),
        unselectedItemColor: Color(0xff454545),
        backgroundColor: Color(0xFFCFD6FF),
        elevation: MediaQuery.of(context).size.width * 0.7,
        useLegacyColorScheme: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Refer & Earn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Rate Ride',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_outlined),
            label: 'Support',
          ),
        ],
        onTap: (value) {},
      ),
    );
  }
}

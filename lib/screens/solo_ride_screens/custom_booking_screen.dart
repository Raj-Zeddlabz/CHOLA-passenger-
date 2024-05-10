import 'dart:async';
import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/controllers/getx_controllers.dart/solo_ride_controller.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/car_selection_screen.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/luggage_passanger_count_widget.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/other_preferences_widget.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/prefered_car_widget.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomBookingScreen extends StatefulWidget {
  const CustomBookingScreen({super.key});

  @override
  State<CustomBookingScreen> createState() => _CustomBookingScreenState();
}

class _CustomBookingScreenState extends State<CustomBookingScreen> {
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

  bool alert = true;
  @override
  Widget build(BuildContext context) {
    if (alert)
      Future.delayed(Duration(milliseconds: 400), () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                alignment: Alignment.topCenter,
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
                  'Please Choose \nthe preferred Car and Click on \nConfirm Booking ',
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
                    position: controller.destinationLocation!)
                // position: LatLng(16.77115, 74.55116)),
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
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFBD1FF), Color(0xffD8D4FF)]),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                // color: Colors.red,
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Your Preferences",
                      style: TextStyle(
                          fontSize: 24.0.sp, fontWeight: FontWeight.w800),
                    ),
                    const LuggagePassangerCountWidget(),
                    const OtherPreferencesWidget(),
                    const PreferedCarWidget(),
                    SizedBox(
                      height: 10.h,
                    ),
                    AgreeButton(
                      buttonText: "Confirm Preferences",
                      onPressed: () {
                        Get.to(CarSelectionScreen());
                      },
                      width: 0.9,
                      borderRadius: 15.r,
                      prefixWidget: Icon(
                        Icons.discord,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                alignment: Alignment.topCenter,
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
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
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
                                  'Please Choose\nthe preferred Car and Click on\nConfirm Booking',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

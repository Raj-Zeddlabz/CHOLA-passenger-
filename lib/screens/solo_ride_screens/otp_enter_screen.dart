import 'dart:async';
import 'package:chola_passanger_ui/controllers/getx_controllers.dart/solo_ride_controller.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/reaching_avenue_screen.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/driver_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OTPEnterScreen extends StatefulWidget {
  const OTPEnterScreen({super.key});

  @override
  State<OTPEnterScreen> createState() => _CustomBookingScreenState();
}

class _CustomBookingScreenState extends State<OTPEnterScreen> {
  // created controller to display Google Maps
  Completer<GoogleMapController> _controller = Completer();

  final controller = Get.find<SoloRideController>();
  TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _otpController.dispose();
  }

  bool alert = true;

  @override
  Widget build(BuildContext context) {
    if (alert) {
      Future.delayed(Duration(seconds: 5), () {
        Get.to(ReachingAvenueScreen());
      });
    }
    alert = false;
    final model = controller.driverInfo[0];

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
                    position: controller.destinationLocation!),
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
                    color: Colors.grey.shade300,
                    width: 4,
                    points: controller.polyLineCoordinates),
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
                        Column(
                          children: [
                            Text(
                              "OTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                6,
                                (index) => Container(
                                  height: 30.w,
                                  width: 30.w,
                                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 0.5,
                                            color: Colors.grey.shade500,
                                            spreadRadius: 0.5,
                                            offset: Offset(-2, 0))
                                      ],
                                      color: Color(0xFFFDE9EA),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  child: Center(
                                    child: Text("7"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
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
            icon: Icon(Icons.call),
            label: 'Call Driver',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Text Driver',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel_presentation),
            label: 'Cancle Ride',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_outlined),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        onTap: (value) {},
      ),
    );
  }
}

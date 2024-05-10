import 'dart:async';
import 'package:chola_passanger_ui/controllers/getx_controllers.dart/solo_ride_controller.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/car_arrival_screen.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/car_details_widget.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/location_field.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({super.key});

  @override
  State<CarSelectionScreen> createState() => _CustomBookingScreenState();
}

class _CustomBookingScreenState extends State<CarSelectionScreen> {
  final controller = Get.find<SoloRideController>();

  int selectedCarIndex = -1;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
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
        // surfaceTintColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
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
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.5,
                          color: Colors.white12,
                          offset: Offset(0, -2),
                          spreadRadius: 0.5),
                    ],
                    border: Border.all(width: 0.8),
                    gradient: LinearGradient(
                        colors: [Color(0xFFFBD1FF), Color(0xffD8D4FF)]),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                // color: Colors.red,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        indent: 140.w,
                        endIndent: 140.w,
                        color: Colors.grey,
                        thickness: 5,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocationField(
                            label: controller.pickUpAddress.value == ''
                                ? 'From'
                                : controller.pickUpAddress.value,
                            isFrom: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 5.h,
                                    child: const VerticalDivider(
                                      color: Colors.green,
                                      thickness: 2.0,
                                    )),
                                SizedBox(
                                  height: 4.h,
                                ),
                                SizedBox(
                                    height: 5.h,
                                    child: const VerticalDivider(
                                      color: Colors.green,
                                      thickness: 2.0,
                                    )),
                              ],
                            ),
                          ),
                          // const SizedBox(height: 20),
                          LocationField(
                            label: controller.destinationAddress.value == ''
                                ? 'Destination'
                                : controller.destinationAddress.value,
                            isFrom: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => SizedBox(
                          height: 300.h,
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                              itemCount: controller.carInfoList.length,
                              itemBuilder: (context, index) {
                                final model = controller.carInfoList[index];
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedCarIndex = index;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10.sp),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: selectedCarIndex == 0
                                                ? Colors.black.withOpacity(0.3)
                                                : Colors.transparent),
                                        child: CarDetailsWidget(
                                            imageUrl: "assets/car3.png",
                                            premiumText: model.carName,
                                            premiumValue: model.price,
                                            duration: model.estimatedTime,
                                            passengerCount: model.seats),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AgreeButton(
                        buttonText: "Confirm Booking",
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await controller.getDriverDetails(double.parse(
                              controller.carInfoList[selectedCarIndex].price));
                          Get.to(CarArrivalScreen());
                          setState(() {
                            isLoading = false;
                          });
                        },
                        width: 0.9,
                        borderRadius: 15.r,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

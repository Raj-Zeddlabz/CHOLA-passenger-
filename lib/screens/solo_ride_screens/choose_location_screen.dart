import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/screens/home_screens/bottom_nav_bar.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/confirm_pickup_location_page.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/address_options.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/location_field.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/trip_type_selection.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:chola_passanger_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_place_picker/flutter_place_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/getx_controllers.dart/solo_ride_controller.dart';

// ignore: must_be_immutable
class ChooseLocationPage extends StatelessWidget {
  ChooseLocationPage({super.key});
  bool alert = true;
  @override
  Widget build(BuildContext context) {
    if (alert) {
      Future.delayed(const Duration(milliseconds: 400), () {
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
                            color: const Color(0xff4320DB),
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
                  'Please Choose \nPickup and Drop off Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            });
      });
    }
    alert = false;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: MediaQuery.of(context).size.height * 0.080,
          title: 'Choose Location',
          onPressed: () {
            Get.offAll(const BottomNavBarScreen());
          },
        ),
        body: LocationPageContent(),
      ),
    );
  }
}

class LocationPageContent extends StatelessWidget {
  LocationPageContent({super.key});
  final controller = Get.find<SoloRideController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffFBD1FF), Color(0xffD8D4FF)])),
      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
      child: Obx(
        () => Stack(
          children: [
            if (controller.fromLoading.value || controller.toLoading.value)
              Align(
                alignment: Alignment.topCenter,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Color(0xff6A4DE8),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const TripTypeSelection(),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () async {
                    controller.fromLoading.value = true;
                    if (controller.pickUpLocation == null) {
                      await controller.getCurrentLocation(true);
                    }
                    await getPlaceFromPicker(context, 'Pickup location', true);
                    controller.fromLoading.value = false;
                  },
                  child: LocationField(
                    label: controller.pickUpAddress.value == ''
                        ? 'From'
                        : controller.pickUpAddress.value,
                    isFrom: true,
                  ),
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
                InkWell(
                  onTap: () async {
                    controller.toLoading.value = true;
                    if (controller.pickUpLocation == null) {
                      await controller.getCurrentLocation(false);
                    }
                    await getPlaceFromPicker(
                        context, 'Destination location', false);
                    controller.toLoading.value = false;
                  },
                  child: LocationField(
                    label: controller.destinationAddress.value == ''
                        ? 'Destination'
                        : controller.destinationAddress.value,
                    isFrom: false,
                  ),
                ),

                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: const AddressOptions(),
                ),
                // const SizedBox(height: 40),
                const Spacer(),
                AgreeButton(
                  buttonText: "Okay",
                  onPressed: () {
                    if (controller.pickUpAddress.value == '') {
                      Constants.showError(
                          context, 'Please Select Pickup Location');
                    } else if (controller.destinationAddress.value == '') {
                      Constants.showError(
                          context, 'Please Select Destination Location');
                    } else {
                      Get.to(ConfirmPickupLocationPage(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 350));
                    }
                  },
                  width: 1.w,
                  borderRadius: 15.r,
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getPlaceFromPicker(
      BuildContext context, String hintText, bool isFrom) async {
    LatLng? pos;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlutterPlacePicker(
          apiKey: Constants.apiKey,
          hintText: hintText,
          initialPosition: isFrom
              ? controller.pickUpLocation ?? const LatLng(18.5204, 73.8567)
              : controller.destinationLocation ??
                  controller.pickUpLocation ??
                  const LatLng(18.5204, 73.8567),
          onPlacePicked: (value) {
            value.geometry!.location.lat;
            value.geometry!.location.lng;
            pos = LatLng(value.geometry?.location.lat ?? 0,
                value.geometry?.location.lng ?? 0);
            if (isFrom) {
              controller.pickUpLocation = pos;
            } else {
              controller.destinationLocation = pos;
            }
            if (pos != null) {
              controller.updateMapCameraToDestination(pos!);
              isFrom
                  ? controller.updateCurrentLocationString(
                      controller.pickUpLocation!, true)
                  : controller.updateCurrentLocationString(
                      controller.destinationLocation!, false);
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

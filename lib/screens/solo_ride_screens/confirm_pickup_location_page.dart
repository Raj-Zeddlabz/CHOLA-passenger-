import 'package:chola_passanger_ui/constants/colors_pallet.dart';
import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/controllers/getx_controllers.dart/solo_ride_controller.dart';
import 'package:chola_passanger_ui/screens/solo_ride_screens/car_selection_screen.dart';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_place_picker/flutter_place_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ConfirmPickupLocationPage extends StatelessWidget {
//   ConfirmPickupLocationPage({super.key});

//   final controller = Get.find<SoloRideController>();
//   @override
//   Widget build(BuildContext context) {
//     LatLng? pos;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 640.h,
//               child: FlutterPlacePicker(
//                 desiredLocationAccuracy: LocationAccuracy.bestForNavigation,
//                 apiKey: Constants.apiKey,
//                 hintText: 'Confirm Pickup Location',
//                 initialPosition:
//                     controller.pickUpLocation ?? const LatLng(18.5204, 73.8567),
//                 onPlacePicked: (value) {
//                   value.geometry!.location.lat;
//                   value.geometry!.location.lng;
//                   pos = LatLng(value.geometry?.location.lat ?? 0,
//                       value.geometry?.location.lng ?? 0);
//                   controller.pickUpLocation = pos;

//                   if (pos != null) {
//                     // controller.updateMapCameraToDestination(pos!);
//                     controller.updateCurrentLocationString(
//                         controller.pickUpLocation!, true);
//                   }
//                   controller.updateCurrentLocationString(pos, true);
//                 },
//               ),
//             ),
//             Container(
//               width: double.maxFinite,
//               height: 230.h,
//               padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
//               decoration: BoxDecoration(
//                   gradient: const LinearGradient(colors: [
//                     AppColors.bottomSheetGradientColor1,
//                     AppColors.bottomSheetGradientColor2
//                   ]),
//                   borderRadius:
//                       BorderRadius.vertical(top: Radius.circular(30.r))),
//               child: Column(
//                 children: [
//                   Text(
//                     'Confirm pickup spot',
//                     style:
//                         TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   const Divider(
//                     color: Colors.black,
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Obx(
//                     () => ListTile(
//                       title: Text(
//                         controller.pickSublocalityAddress.value,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 16.sp),
//                       ),
//                       subtitle: Text(
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         controller.pickUpAddress.value,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w300, fontSize: 14.sp),
//                       ),
//                       trailing: Icon(
//                         Icons.location_on,
//                         size: 25.sp,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   AgreeButton(
//                       buttonText: "Confirm Location",
//                       onPressed: () {
//                         // Get.toNamed(RouteHelper.customBookingSoloScreen);
//                         Get.to(CarSelectionScreen(),
//                             transition: Transition.fadeIn,
//                             duration: Duration(milliseconds: 350));
//                       },
//                       width: 1)
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class ConfirmPickupLocationPage extends StatelessWidget {
  ConfirmPickupLocationPage({super.key});

  final controller = Get.find<SoloRideController>();
  @override
  Widget build(BuildContext context) {
    LatLng? pos;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 640.h,
              child: FlutterPlacePicker(
                desiredLocationAccuracy: LocationAccuracy.bestForNavigation,
                apiKey: Constants.apiKey,
                hintText: 'Confirm Pickup Location',
                initialPosition:
                    controller.pickUpLocation ?? const LatLng(18.5204, 73.8567),
                onPlacePicked: (value) {
                  value.geometry!.location.lat;
                  value.geometry!.location.lng;
                  pos = LatLng(value.geometry?.location.lat ?? 0,
                      value.geometry?.location.lng ?? 0);
                  controller.pickUpLocation = pos;

                  if (pos != null) {
                    // controller.updateMapCameraToDestination(pos!);
                    controller.updateCurrentLocationString(
                        controller.pickUpLocation!, true);
                  }
                  controller.updateCurrentLocationString(pos, true);
                },
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 230.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 0.5,
                        color: Colors.white12,
                        offset: Offset(0, -2),
                        spreadRadius: 0.5),
                  ],
                  border: Border.all(width: 0.8),
                  gradient: const LinearGradient(colors: [
                    AppColors.bottomSheetGradientColor1,
                    AppColors.bottomSheetGradientColor2
                  ]),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.r))),
              child: Column(
                children: [
                  Text(
                    'Confirm pickup spot',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => ListTile(
                      title: Text(
                        controller.pickSublocalityAddress.value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        controller.pickUpAddress.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.sp),
                      ),
                      trailing: Icon(
                        Icons.location_on,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AgreeButton(
                      buttonText: "Confirm Location",
                      onPressed: () async {
                        await controller.getPolyPoints();
                        await controller.getCarInfo();
                        Get.to(CarSelectionScreen(),
                            transition: Transition.fadeIn,
                            duration: Duration(milliseconds: 350));
                      },
                      width: 0.70)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

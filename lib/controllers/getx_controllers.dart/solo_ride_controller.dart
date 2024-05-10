import 'dart:async';

import 'package:chola_passanger_ui/constants/constants.dart';
import 'package:chola_passanger_ui/constants/snackbar.dart';
import 'package:chola_passanger_ui/models/solo_ride_models/car_info_model.dart';
import 'package:chola_passanger_ui/models/solo_ride_models/driver_details_model.dart';
import 'package:chola_passanger_ui/services/solo_ride_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../other_controllers/location_controller.dart';

class SoloRideController extends GetxController {
  LatLng? pickUpLocation;
  LatLng? destinationLocation;
  RxBool fromLoading = false.obs;
  RxBool toLoading = false.obs;
  final Completer<GoogleMapController> _controller = Completer();
  RxList<LatLng> polyLineCoordinates = <LatLng>[].obs;

  RxString pickUpAddress = "".obs;
  RxString pickSublocalityAddress = "".obs;
  RxString destinationAddress = "".obs;

  final SoloRideService _soloService;

  SoloRideController({required SoloRideService soloService})
      : _soloService = soloService;

  RxList<CarInfoModel> carInfoList = <CarInfoModel>[].obs;
  RxList<DriverDetailsModel> driverInfo = <DriverDetailsModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    Position? pos = Get.find<LocationController>().curPosition;
    pos ??= await Get.find<LocationController>().getCurrentLocation();
    if (pos != null) {
      pickUpLocation = LatLng(pos.latitude, pos.longitude);
    }
  }

  Future<void> getCurrentLocation(bool isFrom) async {
    try {
      final pos = await Get.find<LocationController>().getCurrentLocation();
      if (pos != null) {
        isFrom
            ? pickUpLocation = LatLng(pos.latitude, pos.longitude)
            : destinationLocation = LatLng(pos.latitude, pos.longitude);
      }
    } catch (e) {
      CustomSnackbar.showError("Location Permission Required",
          "This app requires location services to function properly. Please enable location in your settings.");
    }
  }

  void updateMapCameraToDestination(LatLng latLang) async {
    if (_controller.isCompleted) {
      GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(latLang));
    }
  }

  void updateCurrentLocationString(LatLng? tappedPoint, bool isFrom) async {
    if (tappedPoint == null) return;
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          tappedPoint.latitude, tappedPoint.longitude);

      String locality = placemarks[0].locality ?? '';
      String subLocality = placemarks[0].subLocality ?? '';
      String administrativeArea = placemarks[0].administrativeArea ?? '';
      String subAdministrativeArea = placemarks[0].subAdministrativeArea ?? '';
      String postalCode = placemarks[0].postalCode ?? '';
      String country = placemarks[0].country ?? '';
      String name = placemarks[0].name ?? '';
      String street = placemarks[0].street ?? '';
      final full_address =
          '$subLocality $locality, $administrativeArea, $postalCode, $country';
      print("Full Address: $full_address");
      print("name: $name, $subAdministrativeArea, $street");
      if (isFrom) {
        pickUpAddress.value = full_address;
        pickSublocalityAddress.value = subLocality;
      } else {
        destinationAddress.value = full_address;
      }
      update();
    } catch (e) {
      print("Error getting placemarks: $e");
    }
  }

  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.apiKey,
        PointLatLng(pickUpLocation!.latitude, pickUpLocation!.longitude),
        PointLatLng(
            destinationLocation!.latitude, destinationLocation!.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
  }

  Future<void> onSubmitChooseLocation() async {
    try {} catch (e) {}
  }

  Future<void> getCarInfo() async {
    try {
      final data = await _soloService.getCarInfo(
          pickupLat: pickUpLocation!.latitude,
          pickupLng: pickUpLocation!.longitude,
          destLat: destinationLocation!.latitude,
          destLng: destinationLocation!.longitude,
          city: 'moradabad');
      carInfoList.value = data;
      print(data);
    } catch (e) {
      CustomSnackbar.showError("Error", e.toString());
    }
  }

  Future<DriverDetailsModel?> getDriverDetails(double fare) async {
    try {
      final data = await _soloService.getDriverDetails(
          pickupLat: pickUpLocation!.latitude,
          pickupLng: pickUpLocation!.longitude,
          destLat: destinationLocation!.latitude,
          destLng: destinationLocation!.longitude,
          city: 'moradabad',
          vehicleType: 2,
          rideReqID: 2,
          fare: fare);
      driverInfo.add(data);
      return data;
    } catch (e) {
      CustomSnackbar.showError("Error", e.toString());
      return null;
    }
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  LatLng? _fromLocation;
  LatLng? _destinationLocation;

  Position? curPosition;

  LatLng? get fromLocation => _fromLocation;
  LatLng? get destinationLocation => _destinationLocation;

  @override
  void onInit() async {
    curPosition = await getCurrentLocation();
    super.onInit();
  }

  void updateFromLocation(LatLng location) {
    _fromLocation = location;
  }

  void updateDestinationLocation(LatLng location) {
    _destinationLocation = location;
  }

  // Additional methods for convenience (optional)

  // Convert LatLng to CameraPosition
  CameraPosition getCameraPosition(LatLng location, {double zoom = 15}) {
    return CameraPosition(
      target: location,
      zoom: zoom,
    );
  }

  Future<Position?> getCurrentLocation() async {
    // Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return null;
        }
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    // Location service is enabled or permission granted
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  // Calculate distance between two LatLng points
  // double calculateDistance(LatLng from, LatLng to) {
  //   // You can use the geolocator package or other libraries to calculate distance
  // }

  // ... add more helper methods as needed
}

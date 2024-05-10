import 'dart:async';
import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

class CustomMapCard extends StatefulWidget {
  @override
  _CustomMapCardState createState() => _CustomMapCardState();
}

class _CustomMapCardState extends State<CustomMapCard> {
  Completer<GoogleMapController> _controller = Completer();
  Position? currentPosition;
  Set<Marker> _markers = Set<Marker>();
  bool mapReady = false;
  String currentLocationName = '';

  @override
  void initState() {
    super.initState();
    if (mounted) _initMap();
  }

  // Initializes the map by requesting location permission, getting the current location, and setting the map ready state.
  Future<void> _initMap() async {
    try {
      await _requestLocationPermission();
      await _getCurrentLocation();
      if (mounted)
        setState(() {
          mapReady = true;
        });
    } catch (e) {
      print("Error initializing map: $e");
      // Handle the error here, for example, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please connect to the Internet.'),
        ),
      );
    }
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String locality = placemarks[0].locality ?? '';
      String subLocality = placemarks[0].subLocality ?? '';
      if (mounted)
        setState(() {
          currentPosition = position;
          currentLocationName = 'Book a Ride From $subLocality, $locality';
          _markers.add(Marker(
            markerId: MarkerId("currentLocation"),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: InfoWindow(
              title: "Current Location",
              snippet: currentLocationName,
            ),
          ));
        });
    } catch (e) {
      print("Error getting current location: $e");
      showDialog(
        // barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Colors.black,
            title: Text(
              'Connection Error',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            content: Text(
              'Please connect to the Internet.',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            actions: [
              Center(
                child: AgreeButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: "OK",
                  width: 0.5,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        color: Colors.black,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ChooseLocation()));
                },
                child: Text(
                  currentLocationName.isNotEmpty
                      ? currentLocationName
                      : 'Places Near You',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                children: [
                  if (mapReady)
                    GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) {
                        if (!_controller.isCompleted) {
                          _controller.complete(controller);
                        }
                      },
                      initialCameraPosition: CameraPosition(
                        zoom: 15.0,
                        target: LatLng(
                          currentPosition?.latitude ?? 0,
                          currentPosition?.longitude ?? 0,
                        ),
                      ),
                      gestureRecognizers: <Factory<
                          OneSequenceGestureRecognizer>>{
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      },
                    ),
                  if (!mapReady)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      print("Error in build method: $e");
      return Container(
        child: CircularProgressIndicator(),
      );
    }
  }
}

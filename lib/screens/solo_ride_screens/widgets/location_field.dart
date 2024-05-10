import 'package:flutter/material.dart';

class LocationField extends StatelessWidget {
  final String label;
  final bool isFrom;

  const LocationField({super.key, required this.label, required this.isFrom});

  @override
  Widget build(BuildContext context) {
    // final locationController = Provider.of<LocationController>(context);
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.width * 0.04,
        ),
        suffixIcon: Icon(
          isFrom ? Icons.my_location : Icons.location_on,
          color: Colors.grey,
        ),
        hintText: isFrom
            ? 'Enter your Pickup Location'
            : 'Enter your Destination Location',
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        icon: Icon(
          isFrom ? Icons.my_location_rounded : Icons.location_on,
          color: isFrom ? Colors.red : Colors.green,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.shortestSide * 0.03,
          horizontal: MediaQuery.of(context).size.shortestSide * 0.04,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      enabled: false,
      readOnly: true,
    );
  }
}

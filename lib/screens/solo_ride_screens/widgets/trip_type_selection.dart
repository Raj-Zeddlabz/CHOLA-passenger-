import 'package:chola_passanger_ui/screens/solo_ride_screens/widgets/custom_drop_down_widget.dart';
import 'package:flutter/material.dart';

class TripTypeSelection extends StatefulWidget {
  const TripTypeSelection({Key? key}) : super(key: key);

  @override
  State<TripTypeSelection> createState() => _TripTypeSelectionState();
}

class _TripTypeSelectionState extends State<TripTypeSelection> {
  // Initial Selected Value
  String dropdownvalue1 = 'For You';
  String dropdownvalue2 = 'One way';
  String dropdownvalue3 = 'Ride Now';

  // List of items in our dropdown menu
  var items1 = [
    'For You',
    'For Other',
  ];
  var items2 = [
    'One way',
    'Two way',
  ];
  var items3 = [
    'Ride Now',
    'Ride Later',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 110,
          height: 35,
          child: CustomDropdown1(
            items: items1,
            onChanged: (value) {
              dropdownvalue1 = value ?? 'For You';
            },
            value: dropdownvalue1,
          ),
        ),
        SizedBox(
          width: 110,
          height: 35,
          child: CustomDropdown1(
            items: items2,
            onChanged: (value) {
              dropdownvalue2 = value ?? 'One way';
            },
            value: dropdownvalue2,
          ),
        ),
        SizedBox(
          width: 110,
          height: 35,
          child: CustomDropdown1(
            items: items3,
            onChanged: (value) {
              dropdownvalue3 = value ?? 'Ride Now';
            },
            value: dropdownvalue3,
          ),
        ),
      ],
    );
  }
}

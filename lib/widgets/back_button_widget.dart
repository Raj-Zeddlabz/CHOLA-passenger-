import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackButtonWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  // Builds the widget for the Back button with GestureDetector, onTap handling, Padding, Container with decoration, and Image asset.
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ??
          () {
            Navigator.of(context).pop();
          },
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.015,
          bottom: MediaQuery.of(context).size.width * 0.01,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Image.asset(
            'assets/BackButton.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MapBackButton extends StatelessWidget {
  const MapBackButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.015,
        ),
        child: Container(
          height: size.height * 0.055,
          width: size.width * 0.15,
          decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Image.asset(
            'assets/BackButton.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

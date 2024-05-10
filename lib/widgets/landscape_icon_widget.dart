import 'package:flutter/material.dart';

class LandscapeIcon extends StatefulWidget {
  @override
  _LandscapeIconState createState() => _LandscapeIconState();
}

class _LandscapeIconState extends State<LandscapeIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBD0FF),
            Color(0xFFFBD0FF),
            Color(0xDBD8D4FF),
            Color(0xDBD8D4FF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Image.asset(
                  'assets/landscape-icon.png',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rotate to Portrait',
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.shortestSide * 0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

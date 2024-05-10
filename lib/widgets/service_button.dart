import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? horizontal;
  final double? vertical;
  final double? fontsize;
  final Widget child_widget;

  const ServiceButton({
    Key? key,
    required this.onPressed,
    required this.child_widget,
    required this.text,
    this.horizontal,
    this.fontsize,
    this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black26,
                borderRadius: BorderRadius.circular(20),
                onTap: onPressed,
                child: Ink(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x7F152BF2),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *
                          (horizontal ?? 0.03),
                      vertical: MediaQuery.of(context).size.height *
                          (vertical ?? 0.03),
                    ),
                    child: child_widget,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.shortestSide *
                    (fontsize ?? 0.05),
                fontFamily: 'Roboto Flex',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

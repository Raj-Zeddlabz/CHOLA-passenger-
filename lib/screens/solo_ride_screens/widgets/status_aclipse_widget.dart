import 'package:chola_passanger_ui/widgets/agree_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusEcliseWidget extends StatelessWidget {
  const StatusEcliseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 100.h,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/eclipse.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Arriving in\n05 Min",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AgreeButton(
                buttonText: "On Time",
                fontSize: 15.sp,
                onPressed: () {},
                width: 0.22),
          )
        ],
      ),
    );
  }
}

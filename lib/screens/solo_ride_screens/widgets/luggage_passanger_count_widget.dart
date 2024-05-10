import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LuggagePassangerCountWidget extends StatefulWidget {
  const LuggagePassangerCountWidget({super.key});

  static int passangerCount = 1;
  static int luggageCount = 1;

  @override
  State<LuggagePassangerCountWidget> createState() =>
      _LuggagePassangerCountWidgetState();
}

class _LuggagePassangerCountWidgetState
    extends State<LuggagePassangerCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin:
                  Alignment.topCenter, // Start the gradient at the top center
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFE3151FA),
                Color.fromRGBO(239, 39, 244, 0.3),
              ]),
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Passanger",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 30.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          LuggagePassangerCountWidget.passangerCount++;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 28.h,
                      color: Colors.white,
                      child: Center(
                          child: Text(LuggagePassangerCountWidget.passangerCount
                              .toString())),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (LuggagePassangerCountWidget.passangerCount !=
                                1) {
                              LuggagePassangerCountWidget.passangerCount--;
                            }
                          });
                        },
                        child: Icon(Icons.remove, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          VerticalDivider(
            color: Colors.black,
            thickness: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Luggages",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 30.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          LuggagePassangerCountWidget.luggageCount++;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 28.h,
                      color: Colors.white,
                      child: Center(
                          child: Text(LuggagePassangerCountWidget.luggageCount
                              .toString())),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (LuggagePassangerCountWidget.luggageCount != 0) {
                            LuggagePassangerCountWidget.luggageCount--;
                          }
                        });
                      },
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

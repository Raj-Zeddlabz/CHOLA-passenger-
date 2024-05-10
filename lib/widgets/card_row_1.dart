import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  final List<Color>? colors;

  const CardRow({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cardText = 'Ride';
    String descriptionText = 'Plan your ride';
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.33,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colors?.length ?? 0,
        itemBuilder: (context, index) {
          if (index == 0) {
            cardText = 'Metro';
            descriptionText = 'Elevate your commute';
          } else if (index == 1) {
            cardText = 'Flexi Ride';
            descriptionText = 'Book & Decide Pickup later';
          } else if (index == 2) {
            cardText = 'Reserve Ride';
            descriptionText = 'Reserve your ride for Future';
          } else if (index == 3) {
            cardText = 'Intercity Ride';
            descriptionText = 'Out station rides with ease';
          }

          return Container(
            width: size.width * 0.6,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.02,
            ),
            child: Material(
              color: colors?[index],
              elevation: 8.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                splashColor: Colors.black26,
                onTap: () {
                  if (index == 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => FlexiRide(),
                    //   ),
                    // );
                  } else if (index == 2) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => RideSchedule(),
                    //   ),
                    // );
                  } else if (index == 3) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => IntercityRide(),
                    //   ),
                    // );
                  }
                  // else if (index == 4) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => RideRental(),
                  //     ),
                  //   );
                  // }
                  else {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ChooseLocation(),
                    //   ),
                    // );
                  }
                },
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    width: size.width * 0.61,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: (index != 1)
                              ? EdgeInsets.only(
                                  bottom: size.height * 0.01,
                                  // (index == 1){ top: size.height * 0.01},
                                  left: size.width * 0.005,
                                  right: size.width * 0.005,
                                )
                              : EdgeInsets.only(
                                  bottom: size.height * 0.01,
                                  top: size.height * 0.0045,
                                  left: size.width * 0.01,
                                  right: size.width * 0.01,
                                ),
                          child: Image.asset(
                            'assets/card_image_${index}.png',
                            fit: BoxFit.fill,
                            // height: size.height * 0.23,
                            width: size.width,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                cardText,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.shortestSide * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Flexible(
                              child: CircleAvatar(
                                radius: size.width * 0.03,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: colors?[index],
                                  size: size.height * 0.03,
                                ),
                              ),
                            )
                          ],
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              descriptionText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.shortestSide * 0.032,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardRow1 extends StatelessWidget {
  final List<Color>? colors;

  const CardRow1({Key? key, required this.colors}) : super(key: key);

  @override

  /// Builds the widget tree for the current context.
  ///
  /// This function returns a widget tree that represents the current state of the
  /// application. It uses the given `BuildContext` to access the screen size and
  /// other properties. The widget tree consists of a `Container` widget that wraps a
  /// `ListView.builder` widget. The `ListView.builder` widget displays a horizontal
  /// list of cards based on the length of the `colors` list. Each card displays an
  /// image, a title, and a description. The image, title, and description are
  /// determined based on the index of the current card.
  ///
  /// The `Container` widget has a height that is 1/3 of the screen height. The
  /// `ListView.builder` widget has a `BouncingScrollPhysics` physics, a horizontal
  /// scroll direction, and a shrinkWrap property set to true.
  ///
  /// When a card is tapped, it navigates to a different page based on the index of
  /// the card. The navigation is done using the `Navigator.push` method.
  ///
  /// Returns a `Widget` that represents the built widget tree.
  Widget build(BuildContext context) {
    String cardText = 'Ride';
    String descriptionText = 'Plan your ride';
    var size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: colors?.length ?? 0,
        itemBuilder: (context, index) {
          if (index == 0) {
            cardText = 'Group Rides';
            descriptionText = 'Invite to ride along';
          } else if (index == 1) {
            cardText = 'Ride Share';
            descriptionText = 'Share & Save Cost';
          } else if (index == 2) {
            cardText = 'Shuttle Rides';
            descriptionText = 'Shuttle Between Hubs';
          } else if (index == 3) {
            cardText = 'Rental Ride';
            descriptionText = 'Rent your ride for long hours';
          } else if (index == 4) {
            cardText = 'School Rides';
            descriptionText = 'Go to school with full safety';
          } else if (index == 5) {
            cardText = 'Corporate Rides';
            descriptionText = 'Go to office without any tension';
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
                  if (index == 0) {
                  } else if (index == 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ChooseLocation(),
                    //   ),
                    // );
                  } else if (index == 2) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ShuttleRide(),
                    //   ),
                    // );
                  } else if (index == 3) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => RideRental(),
                    //   ),
                    // );
                  } else if (index == 4) {
                  } else {
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
                          padding: (index != 3)
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
                            'assets/card_i_${index}.png',
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

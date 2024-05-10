import 'package:chola_passanger_ui/widgets/ad_card_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/agree_button_widget.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/landscape_icon_widget.dart';

class VentureScreen extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<VentureScreen> {
  @override

  /// Builds the widget tree based on the current device orientation.
  ///
  /// The widget tree consists of a [OrientationBuilder] that builds either a
  /// [LandscapeIcon] or a [Padding] widget.
  ///
  /// The [Padding] widget contains a [Scaffold] with an [CustomAppBar], a
  /// [Container] with a [SingleChildScrollView], and a [CustomBottomNavigationBar].
  ///
  /// The [CustomAppBar] has a title of 'Ventures' and an onPressed callback that
  /// sets the current index to 0 and navigates to the [HomePage].
  ///
  /// The [Container] has a gradient background and contains a [Padding] widget
  /// with two [AgreeButton] widgets and an [AdCardWidget].
  ///
  /// The [AgreeButton] widgets have onPressed callbacks that show an error message
  /// and navigate to the [HomePage] or a [ComingSoon] page.
  ///
  /// The [CustomBottomNavigationBar] has a current index and an onTap callback
  /// that sets the current index and navigates to different pages based on the
  /// selected index.
  ///
  /// Returns a [Widget] tree.
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.landscape) {
        return LandscapeIcon();
      } else {
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Scaffold(
            appBar: CustomAppBar(
              preferredHeight: MediaQuery.of(context).size.height * 0.075,
              title: 'Ventures',
              onPressed: () {},
            ),
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: Constants.gradientColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      AgreeButton(
                        buttonText: "Upcoming Rides",
                        // fillColor: [
                        //   Color(0xffC61E9C),
                        //   Color(0xff3D25E8),
                        // ],
                        // height: MediaQuery.of(context).size.height * 0.15,
                        onPressed: () {
                          Constants.showError(context,
                              "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                        },
                        width: 0.8,
                        fontSize:
                            MediaQuery.of(context).size.shortestSide * 0.08,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      AgreeButton(
                        buttonText: "Ride History",
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ComingSoon(),
                          //     ));

                          Constants.showError(context,
                              "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                        },
                        width: 0.8,
                        fontSize:
                            MediaQuery.of(context).size.shortestSide * 0.08,
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15),
                      AdCardWidget(
                        ads: Constants.ads,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }));
  }
}

/// The above code defines two custom list tile widgets in Flutter with different layouts and
/// interactions.
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override

  /// Builds the widget tree for the current [BuildContext].
  ///
  /// The [BuildContext] is used to access the current screen size and status bar height.
  /// The widget tree includes a [LayoutBuilder] widget that wraps a [ListTile] widget.
  /// The [ListTile] widget has a [Row] widget as its title, which includes an [Icon], a [SizedBox], and an [Expanded] widget.
  /// The [Icon] displays an icon from the specified [icon] parameter.
  /// The [SizedBox] adds a small horizontal spacing between the icon and the text.
  /// The [Expanded] widget contains a [Text] widget that displays the specified [title].
  /// The [Text] widget is configured to start align its content, truncate the text with an ellipsis if it overflows, and display a single line of text.
  /// The text style of the [Text] widget is customized with the specified [fontSize] and [Colors.black].
  /// The [ListTile] widget is configured to call the specified [onTap] callback when tapped.
  ///
  /// Returns the built widget tree.
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth * 0.06;
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(width: constraints.maxWidth * 0.02),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          onTap: onTap,
        );
      },
    );
  }
}

class CustomListTile1 extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final double? fontsize;

  const CustomListTile1({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.005,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double fontSize = fontsize ?? constraints.maxWidth * 0.075;
                  return Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

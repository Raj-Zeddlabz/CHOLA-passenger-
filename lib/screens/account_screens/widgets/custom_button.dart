import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override

  /// Builds the widget tree for the current context.
  ///
  /// This function returns a widget tree that represents the current state of the
  /// application. It uses the given `BuildContext` to access the screen size and
  /// other properties. The widget tree consists of an `Expanded` widget that wraps a
  /// `Column` widget. The `Column` widget contains an `ElevatedButton` widget and a
  /// `Text` widget. The `ElevatedButton` widget is styled with a rounded rectangle
  /// shape, transparent background, and a gradient background. It contains an
  /// `Ink` widget that wraps a `Padding` widget. The `Padding` widget contains an
  /// `Icon` widget. The `Text` widget displays the provided `text` parameter.
  ///
  /// The `BuildContext` parameter is the context in which the widget is being built.
  ///
  /// The `VoidCallback` parameter `onPressed` is the callback function that is
  /// triggered when the button is pressed.
  ///
  /// The `IconData` parameter `icon` is the icon to be displayed on the button.
  ///
  /// The `String` parameter `text` is the text to be displayed under the button.
  ///
  /// Returns a `Widget` that represents the built widget tree.
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(217, 40, 180, 1),
                    Color.fromRGBO(67, 32, 219, 1)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.015,
                ),
                child: Icon(
                  icon,
                  size: MediaQuery.of(context).size.width * 0.1,
                  color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}

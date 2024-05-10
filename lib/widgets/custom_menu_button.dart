import 'package:flutter/material.dart';

class CustomMenuIconButton extends StatelessWidget {
  // final VoidCallback onPressed;
  final Widget? child_widget;

  const CustomMenuIconButton({
    Key? key,
    // required this.onPressed,
    this.child_widget,
  }) : super(key: key);

  @override

  /// Builds the widget tree for this widget.
  ///
  /// The [context] parameter is the build context for this widget.
  ///
  /// Returns the built widget tree.
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer(); // Open the drawer
        // onPressed();
      },
      icon: CircleAvatar(
        backgroundColor: Colors.black,
        child: child_widget,
      ),
    );
  }
}

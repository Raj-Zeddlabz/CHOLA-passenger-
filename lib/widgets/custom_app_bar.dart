import 'package:chola_passanger_ui/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPressed;
  final double preferredHeight;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onPressed,
    required this.preferredHeight,
  }) : super(key: key);

  @override

  /// Builds the widget tree for this [BuildContext].
  ///
  /// The [BuildContext] parameter is the context in which the widget is being built.
  ///
  /// Returns a [Widget] that represents the built widget tree.
  Widget build(BuildContext context) {
    return Container(
      height: preferredHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: AppBar(
          primary: false,
          toolbarHeight: 80.h,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.065,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: BackButtonWidget(
            onPressed: onPressed,
          ),
          leadingWidth: MediaQuery.of(context).size.width * 0.14,
          centerTitle: true,
          backgroundColor: Color(0xFFBAC1FF),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

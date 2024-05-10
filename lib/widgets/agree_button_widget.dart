import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgreeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  final double? borderRadius;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final List<Color>? fillColor;

  const AgreeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.width,
    this.prefixWidget,
    this.suffixWidget,
    this.fontWeight,
    this.borderColor,
    this.borderWidth,
    this.textColor,
    this.fillColor,
    this.begin,
    this.end,
    this.fontSize,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textHeight = _getTextHeight(context);
    final minHeight = textHeight + 16.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        splashColor: Colors.black26.withOpacity(0.5),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: fillColor ??
                  [
                    Color(0xffC61E9C),
                    Color(0xff3D25E8),
                  ],
              begin: begin ?? Alignment.topLeft,
              end: end ?? Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            border: Border.all(
              color: borderColor ?? Colors.black,
              width: borderWidth ?? 0,
            ),
          ),
          child: Container(
            constraints: BoxConstraints(minHeight: minHeight),
            width: MediaQuery.of(context).size.width * width,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.width * 0.001,
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixWidget != null) prefixWidget!,
                if (prefixWidget != null)
                  SizedBox(
                    width: 10.w,
                  ),
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize:
                        fontSize ?? MediaQuery.of(context).size.width * 0.055,
                    fontWeight: fontWeight ?? FontWeight.bold,
                    color: textColor ?? Colors.white,
                  ),
                ),
                if (suffixWidget != null) suffixWidget!,
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getTextHeight(BuildContext context) {
    final textSpan = TextSpan(
      text: buttonText,
      style: TextStyle(
        fontSize: fontSize ?? MediaQuery.of(context).size.width * 0.06,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    textPainter.layout(maxWidth: double.infinity);
    return textPainter.size.height;
  }
}

import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final double vertical;
  final double horizontal;
  final double? borderRadius;
  final String? snackbarText;
  final String? prefixText;

  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool? isEditable;
  final bool? obscureText;
  final bool? isLabel;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final BorderSide? borderColor;
  final TextEditingController fieldController;
  final int? maxLength; // Added maxLength property
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  Field({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.icon,
    this.obscureText,
    this.validator,
    this.isLabel = false,
    this.keyboardType,
    this.focusNode,
    required this.vertical,
    required this.horizontal,
    this.snackbarText,
    this.suffixWidget,
    this.prefixWidget,
    this.prefixText,
    this.onTap,
    this.borderColor,
    this.isEditable,
    required this.fieldController,
    this.borderRadius,
    this.onChanged,
    this.maxLength, // Added maxLength parameter to constructor
  }) : super(key: key);

  @override
  // Builds the widget tree for the current context.
  //This function returns a Column widget containing different UI components based on certain conditions.
  // It takes a BuildContext as a parameter.
  //The function includes handling of labelText, GestureDetector, TextFormField,
  //and their respective properties like onTap, onChanged, controller, obscureText, enabled,
  // focusNode, keyboardType, maxLength, decoration, validator, and more.
  Widget build(BuildContext context) {
    // isLabel = false;
    return Column(
      children: [
        (labelText.length != 0 && isLabel!)
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    labelText,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container(),
        GestureDetector(
          onTap: onTap,
          child: TextFormField(
            onChanged: (value) {
              onChanged?.call(value);
            },
            controller: fieldController,
            obscureText: obscureText ?? false,
            enabled: isEditable,
            focusNode: focusNode,
            keyboardType: keyboardType,
            maxLength: maxLength,
            decoration: InputDecoration(
              // labelText: labelText,

              // labelStyle: TextStyle(
              //   // fontFamily: 'Roboto Flex',
              //   fontWeight: FontWeight.w600,
              //   fontSize: MediaQuery.of(context).size.width * 0.045,
              // ),
              hintText: hintText,
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255),
              icon: icon,
              suffixIcon: suffixWidget,

              prefixIcon: prefixWidget,
              prefixText: prefixText,
              prefixStyle: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.040,
              ),
              // prefix: prefixWidget,
              contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.shortestSide * vertical,
                horizontal:
                    MediaQuery.of(context).size.shortestSide * horizontal,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
                borderSide: borderColor ?? BorderSide(color: Colors.black),
              ),
            ),
            validator: validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return snackbarText;
                  }
                  return null;
                },
          ),
        ),
      ],
    );
  }
}

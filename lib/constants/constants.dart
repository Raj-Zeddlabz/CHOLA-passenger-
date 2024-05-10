import 'package:flutter/material.dart';

import '../widgets/agree_button_widget.dart';

class Constants {
  static const List<Color> gradientColor = [
    Color(0xDBD8D4FF),
    Color(0xDBD8D4FF),
    Color(0xFFFBD0FF),
    Color(0xFFFBD0FF),
  ];
  static const String apiKey = "AIzaSyCfHVm5xypidpMEUAEuxmie_FDqme9tiLY";
  static const List<String> ads = [
    'https://www.wordstream.com/wp-content/uploads/2021/07/persuasive-ads-coca-cola-1.jpg',
    'https://www.wordstream.com/wp-content/uploads/2021/07/persuasive-ads-street-easy.jpg',
  ];
  static void showError(BuildContext context, String errorText) {
    var size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Center(
              child: AgreeButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                buttonText: 'Okay',
                width: .5,
              ),
            )
          ],
          content: Text(
            errorText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.shortestSide * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}

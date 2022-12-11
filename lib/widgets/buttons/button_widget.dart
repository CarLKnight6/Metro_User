import 'package:flutter/material.dart';

import '../text/text_bold.dart';

class ButtonWidget extends StatelessWidget {
  late String label;
  late VoidCallback onPressed;
  late Color color;

  ButtonWidget(
      {required this.label, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        minWidth: 290,
        height: 45,
        color: color,
        child: TextBold(
          text: label,
          fontSize: 16,
          color: Colors.white,
        ),
        onPressed: onPressed);
  }
}

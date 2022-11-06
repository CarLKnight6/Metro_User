import 'package:flutter/material.dart';

import '../buttons/button_widget.dart';
import '../text/text_regular.dart';

class NormalDialog extends StatelessWidget {
  late String label;
  late Color buttonColor;
  late IconData icon;
  late Color iconColor;
  late VoidCallback onPressed;
  late String buttonText;

  NormalDialog({
    required this.label,
    required this.buttonColor,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: iconColor,
            ),
            const SizedBox(
              height: 20,
            ),
            TextRegular(text: label, fontSize: 18, color: Colors.black),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ButtonWidget(
                  label: buttonText, color: buttonColor, onPressed: onPressed),
            ),
          ],
        ),
      ),
    );
  }
}

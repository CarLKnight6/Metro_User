import 'package:flutter/material.dart';

class TextRegular extends StatelessWidget {
  late String text;
  late double fontSize;
  late Color color;

  TextRegular({
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: fontSize, color: color, fontFamily: 'QRegular'),
    );
  }
}

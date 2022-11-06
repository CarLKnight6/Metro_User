import 'package:flutter/material.dart';

import '../text/text_bold.dart';

PreferredSizeWidget NormalAppbar(String label, Color color) {
  return AppBar(
    elevation: 0.5,
    foregroundColor: Colors.black,
    backgroundColor: color,
    title: TextBold(text: label, fontSize: 18, color: Colors.black),
    centerTitle: true,
  );
}

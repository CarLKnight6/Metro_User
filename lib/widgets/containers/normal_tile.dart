import 'package:flutter/material.dart';

import '../text/text_bold.dart';

class NormalTile extends StatelessWidget {
  late String label;
  late VoidCallback onTap;
  late Color tileColor;
  late IconData icon;

  NormalTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
      ),
      tileColor: tileColor,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: TextBold(text: label, fontSize: 16, color: Colors.black),
    );
  }
}

import 'package:flutter/material.dart';

import '../text/text_bold.dart';

class BookingTile extends StatelessWidget {
  late String label;
  late VoidCallback onTap;
  late Color tileColor;
  late IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        tileColor: tileColor,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: TextBold(text: label, fontSize: 16, color: Colors.white),
      ),
    );
  }
}

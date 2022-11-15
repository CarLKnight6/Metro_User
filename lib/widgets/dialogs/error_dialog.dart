import 'package:flutter/material.dart';

import '../text/text_bold.dart';
import '../text/text_regular.dart';

class ErrorDialog extends StatelessWidget {
  late String label;

  ErrorDialog({required this.label});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextRegular(text: label, fontSize: 14, color: Colors.black),
      actions: [
        FlatButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: TextBold(text: 'Close', color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../text/text_bold.dart';
import '../text/text_regular.dart';

class HotlineButton extends StatelessWidget {
  late VoidCallback onPressed;

  late String contactNumber;
  late String contactName;

  HotlineButton(
      {required this.contactName,
      required this.contactNumber,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        children: [
          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              minWidth: 275,
              height: 40,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    const Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextBold(
                      text: contactNumber,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              onPressed: onPressed),
          const SizedBox(
            height: 10,
          ),
          TextRegular(text: contactName, fontSize: 16, color: Colors.black),
        ],
      ),
    );
  }
}

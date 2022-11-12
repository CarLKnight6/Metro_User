import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';

class ConvoPage extends StatelessWidget {
  const ConvoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextBold(text: 'Lance Olana', fontSize: 22, color: Colors.black),
      ),
    );
  }
}

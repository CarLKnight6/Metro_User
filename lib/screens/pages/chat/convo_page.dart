import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';

class ConvoPage extends StatelessWidget {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: TextBold(text: 'Lance Olana', fontSize: 22, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
        ],
      ),
      body: Column(
        children: [
          NormalTextField(
              controller: _messageController, label: 'Type a message. .')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class ConvoPage extends StatelessWidget {
  final _messageController = TextEditingController();

  late String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
          Expanded(
            child: SizedBox(
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: TextRegular(
                                      text:
                                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              width: 220,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            minRadius: 25,
                            maxRadius: 25,
                            backgroundColor: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: TextRegular(
                            text: '2:35pm', fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: ColoredBox(
              color: Colors.white,
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (_input) {
                  message = _input;
                },
                controller: _messageController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (message == '') {
                      } else {
                        print('e');
                      }
                    },
                    icon: const Icon(Icons.send, color: Colors.blue),
                  ),
                  hintText: '     Type your message. .',
                  hintStyle: const TextStyle(
                    fontFamily: 'QRegular',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

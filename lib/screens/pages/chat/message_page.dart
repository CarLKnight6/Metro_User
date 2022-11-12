import 'package:flutter/material.dart';
import 'package:taxi_user/screens/pages/chat/convo_page.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../../widgets/drawer/drawer_widget.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Messages', Colors.grey[300]!),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ConvoPage()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: Colors.white,
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                minRadius: 25,
                maxRadius: 25,
              ),
              title: TextBold(
                  text: 'Lance Olana', fontSize: 18, color: Colors.black),
              subtitle: TextRegular(
                  text: 'Rating: 5 ★', fontSize: 12, color: Colors.grey),
              trailing: TextRegular(
                  text: '2:45pm', fontSize: 14, color: Colors.black),
            ),
          );
        }),
      ),
    );
  }
}

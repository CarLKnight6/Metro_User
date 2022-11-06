import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

import '../text/text_bold.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/VERTICAL LOGO FOR LIGHT BG.png',
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const CircleAvatar(
                minRadius: 30,
                maxRadius: 30,
                backgroundColor: Colors.black,
              ),
              title: TextBold(
                  text: 'Good day, Lance!', fontSize: 14, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

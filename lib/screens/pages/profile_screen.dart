import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../widgets/drawer/drawer_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: NormalAppbar('Profile', Colors.grey[300]!),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              minRadius: 50,
              maxRadius: 50,
              backgroundColor: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            TextBold(text: 'Lance Olana', fontSize: 22, color: Colors.black),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              title: TextBold(
                  text: '09090104355', fontSize: 18, color: Colors.black),
              subtitle: TextRegular(
                  text: 'Contact Number', fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              title: TextBold(
                  text: 'lans12345@gmail.com',
                  fontSize: 18,
                  color: Colors.black),
              subtitle: TextRegular(
                  text: 'Email Address', fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              title: TextBold(
                  text: 'Poblacion', fontSize: 18, color: Colors.black),
              subtitle:
                  TextRegular(text: 'Brgy.', fontSize: 12, color: Colors.grey),
            ),
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              title: TextBold(
                  text: 'Impasugong', fontSize: 18, color: Colors.black),
              subtitle: TextRegular(
                  text: 'City/Municipality', fontSize: 12, color: Colors.grey),
            ),
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              title:
                  TextBold(text: 'Bukidnon', fontSize: 18, color: Colors.black),
              subtitle: TextRegular(
                  text: 'Province', fontSize: 12, color: Colors.grey),
            ),
            ExpansionTile(
              children: [
                ListTile(
                  title: TextBold(
                      text: 'Mariza Olana', fontSize: 14, color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Full Name', fontSize: 10, color: Colors.grey),
                ),
                ListTile(
                  title: TextBold(
                      text: '09090104355', fontSize: 14, color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Contact Number', fontSize: 10, color: Colors.grey),
                ),
                ListTile(
                  title: TextBold(
                      text: 'Impasugong Bukidnon',
                      fontSize: 14,
                      color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Address', fontSize: 10, color: Colors.grey),
                ),
              ],
              title: TextBold(
                text: 'Contact Person 1',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            ExpansionTile(
              children: [
                ListTile(
                  title: TextBold(
                      text: 'Elmer Olana', fontSize: 14, color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Full Name', fontSize: 10, color: Colors.grey),
                ),
                ListTile(
                  title: TextBold(
                      text: '09090104355', fontSize: 14, color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Contact Number', fontSize: 10, color: Colors.grey),
                ),
                ListTile(
                  title: TextBold(
                      text: 'Impasugong Bukidnon',
                      fontSize: 14,
                      color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Address', fontSize: 10, color: Colors.grey),
                ),
              ],
              title: TextBold(
                text: 'Contact Person 2',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              label: 'Logout',
              color: Colors.red[600]!,
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

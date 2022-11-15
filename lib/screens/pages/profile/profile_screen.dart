import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_user/screens/pages/profile/saved_locations.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../../auth/login.dart';
import '../../../widgets/drawer/drawer_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData1 = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: TextBold(text: 'Profile', fontSize: 18, color: Colors.black),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SavedLocationsPage()));
            },
            icon: const Icon(Icons.my_location),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: userData1,
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading'));
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              dynamic data = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    minRadius: 50,
                    maxRadius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(data['profilePicture']),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextBold(
                      text: data['firstName'] + " " + data['lastName'],
                      fontSize: 22,
                      color: Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    title: TextBold(
                        text: data['contactNumber'],
                        fontSize: 18,
                        color: Colors.black),
                    subtitle: TextRegular(
                        text: 'Contact Number',
                        fontSize: 12,
                        color: Colors.grey),
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
                        text: data['email'], fontSize: 18, color: Colors.black),
                    subtitle: TextRegular(
                        text: 'Email Address',
                        fontSize: 12,
                        color: Colors.grey),
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
                        text: data['brgy'], fontSize: 18, color: Colors.black),
                    subtitle: TextRegular(
                        text: 'Brgy.', fontSize: 12, color: Colors.grey),
                  ),
                  ListTile(
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    title: TextBold(
                        text: data['city'], fontSize: 18, color: Colors.black),
                    subtitle: TextRegular(
                        text: 'City/Municipality',
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  ListTile(
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    title: TextBold(
                        text: data['province'],
                        fontSize: 18,
                        color: Colors.black),
                    subtitle: TextRegular(
                        text: 'Province', fontSize: 12, color: Colors.grey),
                  ),
                  ExpansionTile(
                    children: [
                      ListTile(
                        title: TextBold(
                            text: data['contactName1'],
                            fontSize: 14,
                            color: Colors.black),
                        subtitle: TextRegular(
                            text: 'Full Name',
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      ListTile(
                        title: TextBold(
                            text: data['contactNumber1'],
                            fontSize: 14,
                            color: Colors.black),
                        subtitle: TextRegular(
                            text: 'Contact Number',
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      ListTile(
                        title: TextBold(
                            text: data['contactAddress1'],
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
                            text: data['contactName2'],
                            fontSize: 14,
                            color: Colors.black),
                        subtitle: TextRegular(
                            text: 'Full Name',
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      ListTile(
                        title: TextBold(
                            text: data['contactNumber2'],
                            fontSize: 14,
                            color: Colors.black),
                        subtitle: TextRegular(
                            text: 'Contact Number',
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      ListTile(
                        title: TextBold(
                            text: data['contactAddress2'],
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: TextBold(
                                    text: 'Logout Confirmation',
                                    color: Colors.black,
                                    fontSize: 14),
                                content: TextRegular(
                                    text: 'Are you sure you want to logout?',
                                    color: Colors.black,
                                    fontSize: 16),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: TextBold(
                                        text: 'Close',
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                  FlatButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: TextBold(
                                        text: 'Continue',
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
                              ));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

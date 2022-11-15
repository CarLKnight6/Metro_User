import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:taxi_user/auth/login.dart';
import 'package:taxi_user/screens/booking_screens/advance_booking.dart';
import 'package:taxi_user/screens/booking_screens/book_now.dart';
import 'package:taxi_user/screens/home_screen.dart';
import 'package:taxi_user/screens/pages/aboutus_page.dart';
import 'package:taxi_user/screens/pages/history_page.dart';
import 'package:taxi_user/screens/pages/hotlines_page.dart';
import 'package:taxi_user/screens/pages/chat/message_page.dart';
import 'package:taxi_user/screens/pages/operator_page.dart';
import 'package:taxi_user/screens/pages/privacy_policy_page.dart';
import 'package:taxi_user/screens/pages/profile/profile_screen.dart';
import 'package:taxi_user/screens/pages/termsofuse_page.dart';
import 'package:taxi_user/services/stream_data.dart';
import 'package:taxi_user/widgets/containers/booking_tile.dart';
import 'package:taxi_user/widgets/containers/normal_tile.dart';

import '../../screens/booking_screens/book_a_friend.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading'));
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          dynamic data = snapshot.data;
          return SizedBox(
            width: 220,
            child: Drawer(
              child: SingleChildScrollView(
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
                      height: 5,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        minRadius: 30,
                        maxRadius: 30,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(data['profilePicture']),
                      ),
                      title: TextBold(
                          text: 'Good day, ${data['firstName']}!',
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BookingTile(
                        icon: Icons.local_taxi,
                        label: 'Book Now',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => BookNowScreen()));
                        },
                        tileColor: Colors.red[600]!),
                    BookingTile(
                        icon: Icons.people_alt_rounded,
                        label: 'Book a Friend',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => BookAFriend()));
                        },
                        tileColor: Colors.red[600]!),
                    BookingTile(
                        icon: Icons.calendar_today_sharp,
                        label: 'Advance Booking',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => AdvanceBooking()));
                        },
                        tileColor: Colors.red[600]!),
                    NormalTile(
                        icon: Icons.home,
                        label: 'Home',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.person,
                        label: 'Profile',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.message_outlined,
                        label: 'Messages',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const MessagePage()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.history,
                        label: 'Ride History',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HistoryPage()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.phone,
                        label: 'Hotlines',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HotlinesPage()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.engineering,
                        label: 'Operator',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const OperatorPage()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.library_books_rounded,
                        label: 'Terms of Use',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsOfUsePage()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.flag,
                        label: 'Privacy Policy',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PrivacyPolicyPage()));
                        },
                        tileColor: Colors.transparent),
                    NormalTile(
                        icon: Icons.info_outline_rounded,
                        label: 'Developer',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const AboutusPage()));
                        },
                        tileColor: Colors.transparent),
                    BookingTile(
                        icon: Icons.logout,
                        label: 'Logout',
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: TextBold(
                                        text: 'Logout Confirmation',
                                        color: Colors.black,
                                        fontSize: 14),
                                    content: TextRegular(
                                        text:
                                            'Are you sure you want to logout?',
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
                        tileColor: Colors.red[600]!),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/SCIVER LOGO.png',
                      height: 80,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:taxi_user/screens/home_screen.dart';
import 'package:taxi_user/screens/pages/profile_screen.dart';
import 'package:taxi_user/widgets/containers/booking_tile.dart';
import 'package:taxi_user/widgets/containers/normal_tile.dart';

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
                height: 20,
              ),
              ListTile(
                leading: const CircleAvatar(
                  minRadius: 30,
                  maxRadius: 30,
                  backgroundColor: Colors.black,
                ),
                title: TextBold(
                    text: 'Good day, Lance!',
                    fontSize: 14,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              BookingTile(
                  icon: Icons.local_taxi,
                  label: 'Book Now',
                  onTap: () {},
                  tileColor: Colors.red[600]!),
              BookingTile(
                  icon: Icons.people_alt_rounded,
                  label: 'Book a Friend',
                  onTap: () {},
                  tileColor: Colors.red[600]!),
              BookingTile(
                  icon: Icons.calendar_today_sharp,
                  label: 'Advance Booking',
                  onTap: () {},
                  tileColor: Colors.red[600]!),
              NormalTile(
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.history,
                  label: 'Ride History',
                  onTap: () {},
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.person,
                  label: 'Profile',
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.phone,
                  label: 'Hotlines',
                  onTap: () {},
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.engineering,
                  label: 'Operator',
                  onTap: () {},
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.library_books_rounded,
                  label: 'Terms of Use',
                  onTap: () {},
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.flag,
                  label: 'Privacy Policy',
                  onTap: () {},
                  tileColor: Colors.transparent),
              NormalTile(
                  icon: Icons.info_outline_rounded,
                  label: 'Developer',
                  onTap: () {},
                  tileColor: Colors.transparent),
              BookingTile(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () {},
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
  }
}

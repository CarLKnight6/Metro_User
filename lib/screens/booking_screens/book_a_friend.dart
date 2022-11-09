import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/markers/book_a_friend_marker.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class BookAFriend extends StatefulWidget {
  static const CameraPosition _camPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<BookAFriend> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookAFriend> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: NormalAppbar('Book a Friend', Colors.white),
      body: Stack(
        children: [
          GoogleMap(
            markers: Set<Marker>.from(markers),
            mapType: MapType.normal,
            initialCameraPosition: BookAFriend._camPosition,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                bookAFriendMarker(markers, context);
              });
              _controller.complete(controller);
            },
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 32,
                                  color: Colors.red[700],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                TextRegular(
                                    text: 'Current Location',
                                    fontSize: 12,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.asset('assets/images/Arrow 3.png'),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextRegular(
                                    text: 'Destination Location',
                                    fontSize: 12,
                                    color: Colors.black),
                                const SizedBox(
                                  width: 50,
                                ),
                                Icon(
                                  Icons.local_taxi_rounded,
                                  size: 32,
                                  color: Colors.green[700],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 120,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

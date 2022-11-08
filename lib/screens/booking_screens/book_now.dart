import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class BookNowScreen extends StatefulWidget {
  static const CameraPosition _camPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  marker1() async {
    Marker mark1 = Marker(
        markerId: const MarkerId('mark1'),
        infoWindow: InfoWindow(
          onTap: () {
            showModalBottomSheet(
                context: context,
                enableDrag: true,
                builder: (context) {
                  return Container(
                    height: 750,
                    color: Colors.red[600],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 520,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBold(
                                  text: 'Driver and Taxi Information',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Name: Lance Olana',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Rating: 4.5 ★',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Plate Number: 12345',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Color of Vehicle: White',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Model: Honda Civic 192',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextBold(
                                  text: 'Location and Routes',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Current Location',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    child: Center(
                                      child: TextBold(
                                          text: 'Your current location',
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Destination Location',
                                    fontSize: 14,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    child: Center(
                                      child: TextBold(
                                          text: 'Cagayan De Oro City',
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: TextRegular(
                                      text: 'Estimated Fare',
                                      fontSize: 14,
                                      color: Colors.black),
                                  trailing: TextBold(
                                      text: '200.00php',
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: ButtonWidget(
                                      label: 'Book Now',
                                      color: Colors.red[600]!,
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          snippet: '09090104355',
          title: 'Lance Olana',
        ),
        icon: BitmapDescriptor.defaultMarker,
        position: const LatLng(37.42796133580664, -122.085749655962));

    setState(() {
      markers.add(mark1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: NormalAppbar('Book Now', Colors.white),
      body: Stack(
        children: [
          GoogleMap(
            markers: Set<Marker>.from(markers),
            mapType: MapType.normal,
            initialCameraPosition: BookNowScreen._camPosition,
            onMapCreated: (GoogleMapController controller) {
              marker1();
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

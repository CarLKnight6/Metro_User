import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../plugins/geolocation.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    determinePosition();
    getLocation();
  }

  late String currentAddress;

  late double lat;
  late double long;

  var hasLoaded = false;
  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> p =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = p[0];

    setState(() {
      lat = position.latitude;
      long = position.longitude;
      currentAddress =
          '${place.street}, ${place.subLocality}, ${place.locality}';
      hasLoaded = true;
    });
  }

  final Stream<DocumentSnapshot> userData1 = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  GoogleMapController? mapController;

  late String location;

  camPosition(double lat, double long) {
    if (location == 'Home') {
      setState(() {
        mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, long), zoom: 16)));
      });
    } else if (location == 'Office') {
      setState(() {
        mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, long), zoom: 16)));
      });
    } else {
      setState(() {
        mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, long), zoom: 16)));
      });
    }
  }

  newMarker(double lat1, double long1, String label) async {
    Marker mark1 = Marker(
        onDrag: (value) {
          print(value);
        },
        draggable: true,
        markerId: const MarkerId('label'),
        infoWindow: InfoWindow(
          title: label,
        ),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat1, long1));

    markers.add(mark1);
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition _camPosition = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    return hasLoaded
        ? Scaffold(
            drawer: const DrawerWidget(),
            appBar: NormalAppbar('Home', Colors.grey[300]!),
            body: Stack(
              children: [
                GoogleMap(
                  markers: markers,
                  mapType: MapType.normal,
                  initialCameraPosition: _camPosition,
                  onMapCreated: (controller) {
                    setState(() {
                      newMarker(lat, long, 'Your Location');
                      mapController = controller;
                    });
                  },
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextRegular(
                              text: 'Search location',
                              fontSize: 14,
                              color: Colors.black),
                          const Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: userData1,
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: Text('Loading'));
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      dynamic data = snapshot.data;

                      print(data['homeLat']);

                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                    backgroundColor: Colors.red,
                                    child: const Icon(
                                      Icons.my_location,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      mapController?.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                  target: LatLng(lat, long),
                                                  zoom: 16)));

                                      setState(() {
                                        newMarker(lat, long, 'Your Location');
                                      });
                                    }),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      mapController?.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                  target: LatLng(
                                                      data['homeLat'],
                                                      data['homeLong']),
                                                  zoom: 16)));

                                      setState(() {
                                        newMarker(data['homeLat'],
                                            data['homeLong'], 'Home');
                                      });
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.home,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextRegular(
                                              text: 'Home',
                                              fontSize: 12,
                                              color: Colors.white),
                                        ],
                                      ),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      mapController?.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                  target: LatLng(
                                                      data['officeLat'],
                                                      data['officeLong']),
                                                  zoom: 16)));

                                      setState(() {
                                        newMarker(data['officeLat'],
                                            data['officeLong'], 'Workplace');
                                      });
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.work_outline_outlined,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextRegular(
                                              text: 'Workplace',
                                              fontSize: 12,
                                              color: Colors.white),
                                        ],
                                      ),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      mapController?.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                  target: LatLng(
                                                      data['schoolLat'],
                                                      data['schoolLong']),
                                                  zoom: 16)));

                                      setState(() {
                                        newMarker(data['schoolLat'],
                                            data['schoolLong'], 'School');
                                      });
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.school_outlined,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextRegular(
                                              text: 'School',
                                              fontSize: 12,
                                              color: Colors.white),
                                        ],
                                      ),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              height: 120,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}

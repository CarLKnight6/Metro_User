import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/services/providers/saved_location_provider.dart';

import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:uuid/uuid.dart';

import '../plugins/geolocation.dart';
import '../widgets/delegate/search_my_places.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    determinePosition();
    getLocation();
  }

  late String currentAddress;

  late double lat = 0;
  late double long = 0;

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

  late LatLng newCoordinates = LatLng(
    ref.read(latProvider.notifier).state,
    ref.read(longProvider.notifier).state,
  );

  newMarker(double lat1, double long1, String label) async {
    Marker mark1 = Marker(
        onDrag: (value) {
          setState(() {
            newCoordinates = value;
          });
        },
        draggable: true,
        markerId: const MarkerId('label'),
        infoWindow: InfoWindow(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      color: Colors.grey[200],
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                          TextRegular(
                              text: 'Mark this place as:',
                              fontSize: 14,
                              color: Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: MaterialButton(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.home),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    TextRegular(
                                        text: 'Home',
                                        fontSize: 12,
                                        color: Colors.black),
                                  ],
                                ),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    'homeLat': newCoordinates.latitude,
                                    'homeLong': newCoordinates.longitude,
                                  });
                                  showToast();
                                  Navigator.of(context).pop();
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: MaterialButton(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.work_outline_outlined),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    TextRegular(
                                        text: 'Workplace',
                                        fontSize: 12,
                                        color: Colors.black),
                                  ],
                                ),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    'officeLat': newCoordinates.latitude,
                                    'officeLong': newCoordinates.longitude,
                                  });
                                  showToast();
                                  Navigator.of(context).pop();
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: MaterialButton(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.school_outlined),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    TextRegular(
                                        text: 'School',
                                        fontSize: 12,
                                        color: Colors.black),
                                  ],
                                ),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    'schoolLat': newCoordinates.latitude,
                                    'schoolLong': newCoordinates.longitude,
                                  });
                                  showToast();
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          title: label,
        ),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat1, long1));

    markers.add(mark1);
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "Place updated succesfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showToast1() {
    Fluttertoast.showToast(
        msg: "Location not set",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
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
                Consumer(
                  builder: (context, ref, child) {
                    return GestureDetector(
                      onTap: () async {
                        final sessionToken = const Uuid().v4();

                        await showSearch(
                            context: context,
                            delegate: LocationsSearch(sessionToken));

                        if (ref.read(latProvider.notifier).state != 0) {
                          mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(
                                      ref.read(latProvider.notifier).state,
                                      ref.read(longProvider.notifier).state),
                                  zoom: 16)));

                          setState(() {
                            newMarker(
                                ref.read(latProvider.notifier).state,
                                ref.read(longProvider.notifier).state,
                                ref.read(addressProvider.notifier).state);
                          });
                        } else {
                          mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(lat, long), zoom: 16)));
                        }
                      },
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SingleChildScrollView(
                                  child: SizedBox(
                                    width: 200,
                                    child: TextRegular(
                                        text: ref
                                            .read(addressProvider.notifier)
                                            .state,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
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
                    );
                  },
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
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (data['homeLat'] == 0) {
                                        showToast1();
                                      } else {
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
                                      }
                                    }),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                    backgroundColor: Colors.red,
                                    child: const Icon(
                                      Icons.work_outline_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (data['officeLat'] == 0) {
                                        showToast1();
                                      } else {
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
                                      }
                                    }),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                    backgroundColor: Colors.red,
                                    child: const Icon(
                                      Icons.school,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (data['schoolLat'] == 0) {
                                        showToast1();
                                      } else {
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
                                      }
                                    }),
                              ),
                            ),
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

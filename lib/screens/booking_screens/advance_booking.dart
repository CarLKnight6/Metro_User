import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/markers/advance_booking_marker.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../plugins/geolocation.dart';
import '../../widgets/markers/my_location_marker.dart';

class AdvanceBooking extends StatefulWidget {
  @override
  State<AdvanceBooking> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<AdvanceBooking> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    determinePosition();
    getLocation();

    getData1();
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
    });

    getData();
  }

  late String profilePicture;
  late String driverName;
  late String driverContactNumber;
  late double ratings;
  late int reviews;
  late String plateNumber;
  late String vehicleColor;
  late String vehicleModel;
  late double driverLat;
  late double driverLang;
  late String driverId;

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Drivers')
        .where('isActive', isEqualTo: true);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          setState(() {
            profilePicture = data['profile_picture'];
            driverName = data['name'];
            driverContactNumber = data['contact_number'];
            ratings = data['star'];
            reviews = data['ratings'];
            plateNumber = data['plate_number'];
            vehicleColor = data['vehicle_color'];
            vehicleModel = data['vehicle_model'];
            driverLat = data['lat'];
            driverLang = data['lang'];
            driverId = data['id'];

            advanceBookingMarker(
              markers,
              context,
              profilePicture,
              driverName,
              driverContactNumber,
              ratings,
              reviews,
              plateNumber,
              vehicleColor,
              vehicleModel,
              driverLat,
              driverLang,
              driverId,
              myName,
              myContactnumber,
              myProfilePicture,
              myId,
              lat,
              long,
              "User's current location",
              0, // payment
              'Date',
            );
            hasLoaded = true;
          });
        }
      });
    }
  }

  late String myName;
  late String myContactnumber;
  late String myProfilePicture;
  late String myId;

  getData1() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          setState(() {
            myName = data['firstName'] + ' ' + data['lastName'];
            myContactnumber = data['contactNumber'];
            myProfilePicture = data['profilePicture'];
            myId = data['id'];
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _camPosition = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: NormalAppbar('Advance Booking', Colors.white),
      body: hasLoaded ? Stack(
        children: [
          GoogleMap(
            markers: Set<Marker>.from(markers),
            mapType: MapType.normal,
            initialCameraPosition: _camPosition,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                myLocationMarker(markers, context, lat, long);
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
      ) : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}



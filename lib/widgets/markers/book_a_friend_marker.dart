import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/screens/booking_screens/book_a_friend.dart';
import 'package:taxi_user/services/cloud_function/book_a_friend.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/delegate/search_pickup.dart';
import 'package:uuid/uuid.dart';

import '../../services/providers/destination_provider.dart';
import '../delegate/search_destination.dart';
import '../dialogs/booking_details_dialog.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';
import '../textfields/contactnumber_field.dart';
import '../textfields/normal_field.dart';

bookAFriendMarker(
  Set<Marker> markers,
  BuildContext context,
  String profilePicture,
  String driverName,
  String driverContactNumber,
  double ratings,
  int reviews,
  String plateNumber,
  String vehicleColor,
  String vehicleModel,
  double driverLat,
  double driverLang,
  String driverId,
  String userName,
  String userContactNumber,
  String userProfilePicture,
  String userId,
  double payment,
  TextEditingController _nameController,
  TextEditingController _contactNumberController,
) async {
  showToast() {
    Fluttertoast.showToast(
        msg: "Booked succesfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Marker mark1 = Marker(
      markerId: MarkerId(driverContactNumber),
      infoWindow: InfoWindow(
        onTap: () {
          showModalBottomSheet(
              context: context,
              enableDrag: true,
              builder: (context) {
                return Consumer(
                  builder: ((context, ref, child) {
                    double rate = ratings / reviews;
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
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                                      text: 'Name: $driverName',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text:
                                          'Rating: ${rate.toStringAsFixed(2)} ★',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Plate Number: $plateNumber',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Color of Vehicle: $vehicleColor',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Model: $vehicleModel',
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
                                      text: "Friend's Current Location",
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final sessionToken = const Uuid().v4();
                                      showSearch(
                                          context: context,
                                          delegate: PickupSearch(sessionToken));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: TextBold(
                                              text: ref
                                                  .watch(
                                                      pickupProvider.notifier)
                                                  .state,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      height: 40,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                      text: "Friend's Destination Location",
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final sessionToken = const Uuid().v4();
                                      showSearch(
                                          context: context,
                                          delegate:
                                              AddressSearch(sessionToken));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: TextBold(
                                              text: ref
                                                  .watch(destinationProvider
                                                      .notifier)
                                                  .state,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      height: 40,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                        label: 'Continue',
                                        color: Colors.red[600]!,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  title: TextBold(
                                                      text:
                                                          "Friend's personal Details",
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                  content: SizedBox(
                                                    height: 180,
                                                    child: Column(
                                                      children: [
                                                        NormalTextField(
                                                            controller:
                                                                _nameController,
                                                            label:
                                                                'Name of Friend'),
                                                        ContactNumberField(
                                                            controller:
                                                                _contactNumberController,
                                                            label:
                                                                'Contact Number of Friend'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(true),
                                                      child: TextRegular(
                                                          text: 'Close',
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                    ),
                                                    FlatButton(
                                                      onPressed: () async {
                                                        // Navigator.of(context).pushReplacement(
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => LoginPage()));

                                                        List<Location>
                                                            location =
                                                            await locationFromAddress(
                                                          ref
                                                              .watch(
                                                                  destinationProvider
                                                                      .notifier)
                                                              .state,
                                                        );

                                                        List<Location>
                                                            location1 =
                                                            await locationFromAddress(
                                                          ref
                                                              .watch(
                                                                  pickupProvider
                                                                      .notifier)
                                                              .state,
                                                        );

                                                        double distance =
                                                            calculateDistance(
                                                          location1[0].latitude,
                                                          location1[0]
                                                              .longitude,
                                                          location[0].latitude,
                                                          location[0].longitude,
                                                        );

                                                        Navigator.of(context)
                                                            .pop(true);
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return BookingDetailsDialog(
                                                                  passengerName:
                                                                      _nameController
                                                                          .text,
                                                                  passengerContactNumber:
                                                                      _contactNumberController
                                                                          .text,
                                                                  driverName:
                                                                      driverName,
                                                                  driverRating:
                                                                      rate,
                                                                  plateNumber:
                                                                      plateNumber,
                                                                  vehicleColor:
                                                                      vehicleColor,
                                                                  vehicleModel:
                                                                      vehicleModel,
                                                                  pickupLocation: ref
                                                                      .watch(pickupProvider
                                                                          .notifier)
                                                                      .state,
                                                                  destinationLocation: ref
                                                                      .watch(destinationProvider
                                                                          .notifier)
                                                                      .state,
                                                                  fare: ((distance *
                                                                              12) +
                                                                          50)
                                                                      .toStringAsFixed(
                                                                          2),
                                                                  onPressed:
                                                                      () {
                                                                    bookAFriend(
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
                                                                      userName,
                                                                      userContactNumber,
                                                                      userProfilePicture,
                                                                      userId,
                                                                      location1[
                                                                              0]
                                                                          .latitude,
                                                                      location1[
                                                                              0]
                                                                          .longitude,
                                                                      location[
                                                                              0]
                                                                          .latitude,
                                                                      location[
                                                                              0]
                                                                          .longitude,
                                                                      ref
                                                                          .watch(
                                                                              destinationProvider.notifier)
                                                                          .state,
                                                                      ref
                                                                          .watch(
                                                                              pickupProvider.notifier)
                                                                          .state,
                                                                      (distance *
                                                                              12) +
                                                                          50,
                                                                      _nameController
                                                                          .text,
                                                                      _contactNumberController
                                                                          .text,
                                                                    );

                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'Drivers')
                                                                        .doc(
                                                                            driverId)
                                                                        .update({
                                                                      'ratings':
                                                                          reviews +
                                                                              1,
                                                                    });

                                                                    showToast();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                BookAFriend()));
                                                                  });
                                                            });
                                                      },
                                                      child: TextBold(
                                                          text: 'Continue',
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
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
                  }),
                );
              });
        },
        snippet: driverContactNumber,
        title: driverName,
      ),
      icon: await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(24, 24),
        ),
        'assets/images/driver.png',
      ),
      position: LatLng(driverLat, driverLang));

  markers.add(mark1);
}
